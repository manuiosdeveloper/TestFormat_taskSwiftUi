//
//  ProductCardView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import SwiftUI

// MARK: - Product Card View
struct ProductCardView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
         
            ZStack {
                
               
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 150, height: 150)
                
                ProductImageView(imageUrl: product.image ?? "")
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .cornerRadius(10)
               
                Image("ProductWishlist")
                    .padding(.top, -60)
                    .padding(.leading, 80)
                    .frame(width: 5, height: 5)
                    .scaledToFill()
                
            }
            
            Text(product.title ?? "")
                .scaledToFit()
                .fontWeight(.semibold)
                .frame(width: 150, height: 30)
                .foregroundColor(Color(hex: "#252525"))

            HStack {
               // Text("\(product.price ?? 0.0)")
                Text("₹\(product.price ?? 0, specifier: "%.2f")")
                    .bold()
                    .foregroundColor(Color(hex: "#252525"))
                Text("₹\(product.price ?? 0, specifier: "%.2f")").strikethrough()
                    .foregroundColor(Color(hex: "#818789"))
                    .font(.system(size: 13))
                
            }
        }
        .padding(.leading,3)
        .frame(maxWidth: .infinity, alignment: .leading) // Important

        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    ProductCardView(product: Product(id: 1, title: "NAME", price: 0.0, category: "", description: "", quantity: 99, image: "", rating:Rating(rate: 9.000,count: 9)))
}




struct ProductImageView: View {
    let imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()  // Shows a loading indicator
            case .success(let image):
                image.resizable()
                
                    
            case .failure:
                Image(systemName: "photo")  // Placeholder for error
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}


//#Preview {
//    ProductCardView(product: "")
//}

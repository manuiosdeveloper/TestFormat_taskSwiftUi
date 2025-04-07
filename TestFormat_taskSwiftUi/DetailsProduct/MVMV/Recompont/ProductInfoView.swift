//
//  ProductInfoView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import SwiftUI

// MARK: - Product Info
struct ProductInfoView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(product.title ?? "")
                .font(.title2)
                .bold()
            
            HStack {
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(hex: "#B2D6D2"))
                    
                        Text("\(product.rating.rate)")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        Text("\("177") reviews")
                    //Text("\(product.price ?? 0) reviews")
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(Color(hex: "#C3E705"))
                    Text("\("94")%")
                        .foregroundColor(.black)
//                    systemImage: "hand.thumbsup.fill")
                        .fontWeight(.semibold)
                    // Label("\(product.price ?? 0)%", systemImage: "hand.thumbsup.fill")
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
                HStack {
                    Image(systemName: "questionmark.square.fill")
                    Text("\(product.rating.count)")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                  
                   
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
                
            }
            
            HStack {
                Text("£\(product.price ?? 0.0, specifier: "%.2f")")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.black)
                    // Title font
                
                
                Text("from £\(product.price ?? 0.0, specifier: "%.0f") per month")
                    .font(.system(size: 13, weight: .light))
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "info.circle")
               
            }
            .font(.subheadline)
           // .background(Color.white)
            .foregroundColor(.gray)
//            .background(Color(hex: "#F0F1F2"))
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
           
        }
    }
}



// MARK: - Add to Cart Button
struct AddToCartButton: View {
    var body: some View {
        Button(action: {}) {
            Text("Add to cart")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(hex: "#C3E705"))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}


// MARK: - Delivery Info
struct DeliveryInfoView: View {
    let date: String
    
    var body: some View {
        Text("Delivery on \(date)")
            .font(.footnote)
            .foregroundColor(.gray)
    }
}


// MARK: - Preview
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
//        let sampleProduct = Product(
//            id: 123, title: "Nintendo Switch, Gray", price: 11.00, category: "", description: "", image: "")
        let sampleProduct = Product(id: 123,
            title: "Nintendo Switch, Gray",
            price: 169.00,
            category: "14.00",
                                    description: "The Nintendo Switch gaming console is a compact device that can be taken everywhere. This portable super device is also equipped with 2 gamepads.", quantity: 2,
                                    image: "26 October", rating: Rating(rate: 0.0, count: 5))
        
       // ProductDetailView(viewModel: ProductDetailViewModel(product: sampleProduct))
    }
}


//#Preview {
//    ProductInfoView(product: Product(from: AnyView(EmptyView() as some View)))
//}

//
//  FlashSaleView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import SwiftUI

// MARK: - Flash Sale View
struct FlashSaleView: View {
    
    let products: [Product]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Flash Sale")
                    .font(.title2)
                        .bold()
                    //.foregroundColor(Color(hex: "#F0F1F2"))

                  
                    .bold()
                Text("02:59:23")
                    .padding(5)
                    .font(.system(size: 10, weight: .light))
//                    .background(Color.green)
                    .background(Color(hex: "#C3E705"))
                    .cornerRadius(5)
                
                Spacer()
                Text("See All")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(Color(hex: "#818789"))
                    
                    .font(.title)
                    .bold()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: "#F0F1F2"))
                        .frame(width: 20, height: 20)
                    
                       // .foregroundColor(Color(hex: "#F0F1F2"))
                    Image("right-arrow-angle-2")
                    .frame(width: 20, height: 20)
                }

                    //.padding()
                    
                
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                    
                    ForEach(products, id: \.title) { product in
                        //ProductCardView(product: product)
                        
                        Button(action: {}) {
                            NavigationLink(destination: ProductDetailView(viewModel: ProductDetailViewModel(product: product), product: product)) {
                                ProductCardView(product: product)
                            }
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    FlashSaleView()
//}

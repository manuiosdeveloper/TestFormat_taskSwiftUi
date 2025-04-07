//
//  CartItemView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manojon 05/04/25.
//

import SwiftUI

// MARK: - Reusable Cart Item Component
struct CartItemView: View {
    let item: Product
    @ObservedObject var viewModel: CartViewModel
    
    
    var body: some View {
        HStack {
            Image(viewModel.itemsProduct.first?.image ?? "")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(item.title ?? "")
                    .font(.headline)
               // Text("\u00a3\(item.price, specifier: "%.2f")"verbatim: "")
                  //  .font(.subheadline)
            }
            Spacer()
            
//            HStack {
//                Button(action: { viewModel.decreaseQuantity(for: item) }) {
//                    Image(systemName: "minus.circle")
//                }
//                Text("\(item.quantity)")
//                Button(action: { viewModel.increaseQuantity(for: item) }) {
//                    Image(systemName: "plus.circle")
//                }
//            }
        }
        .padding()
    }
}

// MARK: - Preview
//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView()
//    }
//}

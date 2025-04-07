//
//  CartViewModel.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 05/04/25.
//

import Foundation
import SwiftUI

// MARK: - ViewModel
class CartViewModel: ObservableObject {
    
//    @Published var itemsProduct: [Product] = [Product(id: 1, title: "", price: 0.0, category: "", description: "", quantity: 1, image: ""),
//                                              Product(id: 1, title: "", price: 0.0, category: "", description: "", quantity: 1, image: "")
//    
//    
//    ]
    
    @Published var itemsProduct: [Productproduct] = []
    
    @Published var itemsProductValue: [Product] = []
    
//    var
//    
//    @Published var items: [CartItem] = [
//        CartItem(image: "iphone-2", title: "Nintendo Switch Lite, Yellow", price: 109.00, quantity: 1),
//        CartItem(image: "discount-2", title: "The Legend of Zelda: Tears of the Kingdom (Nintendo Switch)", price: 39.00, quantity: 1)
//    ]
    
    @Published var  items: [CartItem] = []
    
    
//    func reloadData() {
//        
//        for productArray in itemsProductValue {
//            
//            
//            itemsProduct.append(productArray)
//            
//        }
//        
//    }
    
    var totalItems: Int {
        itemsProduct.reduce(0) { $0 + ($1.quantity ?? 0) }
    }
    
    func increaseQuantity(for item: Productproduct) {
        if let index = itemsProduct.firstIndex(where: { $0.id == item.id }) {
            itemsProduct[index].quantity! += 1
        }
    }
    
    func decreaseQuantity(for item: Productproduct) {
        if let index = itemsProduct.firstIndex(where: { $0.id == item.id }), itemsProduct[index].quantity! > 1 {
            itemsProduct[index].quantity! -= 1
        }
    }
}

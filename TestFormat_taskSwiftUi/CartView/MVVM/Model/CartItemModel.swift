//
//  CartItemModel.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 05/04/25.
//

import Foundation

//// MARK: - Model
struct CartItem: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let price: Double
    var quantity: Int
}

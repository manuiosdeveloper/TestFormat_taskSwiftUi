//
//  HomeViewModel.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import Foundation
import SwiftUI


//struct Product: Identifiable {
//    let id = UUID()
//    let name: String
//    let price: String
//    let oldPrice: String
//}


struct Product: Codable, Identifiable {
//    var idvalien: UUID = UUID()
    var id: Int?
    let title: String?
    let price: Double?
    let category:String
    let description: String?
    let quantity: Int?
    let image: String?
    let rating: Rating
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

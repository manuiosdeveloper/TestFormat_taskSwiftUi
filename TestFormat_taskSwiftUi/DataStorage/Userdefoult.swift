//
//  Userdefoult.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import Foundation


// MARK: - Product Model
struct Productproduct: Codable, Identifiable, Equatable {
    var id: Int?
    let title: String?
    let price: Double?
    let category: String
    let description: String?
    var quantity: Int?
    let image: String?
}



class ProductStorageViewModel: ObservableObject {
    @Published var savedProducts: [Productproduct] = []
    private let key = "savedProductsKey"

    init() {
        loadProducts()
    }

    func saveProduct(_ product: Productproduct) {
        loadProducts()
        
        // Avoid duplicate entries
        if !savedProducts.contains(where: { $0.id == product.id }) {
            savedProducts.append(product)
            if let data = try? JSONEncoder().encode(savedProducts) {
                UserDefaults.standard.set(data, forKey: key)
            }
        }
    }

    func loadProducts() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Productproduct].self, from: data) {
            self.savedProducts = decoded
        } else {
            self.savedProducts = []
        }
    }

    func clearAll() {
        UserDefaults.standard.removeObject(forKey: key)
        savedProducts = []
    }
}


// MARK: - ProductStore
//class ProductStore: ObservableObject {
//    @Published var products: [Productproduct] = []
//    private let key = "saved_products"
//    
//    init() {
//        loadProducts()
//    }
//    
//    func addProduct(_ product: Productproduct) {
//        products.append(product)
//        saveProducts()
//    }
//    
//    private func saveProducts() {
//        if let encoded = try? JSONEncoder().encode(products) {
//            UserDefaults.standard.set(encoded, forKey: key)
//        }
//    }
//    
//    private func loadProducts() {
//        if let data = UserDefaults.standard.data(forKey: key),
//           let decoded = try? JSONDecoder().decode([Productproduct].self, from: data) {
//            products = decoded
//        }
//    }
//}

// MARK: - CartStore
//class CartStore: ObservableObject {
//    @Published var cartItems: [Productproduct] = []
//    
//    func addToCart(_ product: Productproduct) {
//        if !cartItems.contains(where: { $0.id == product.id }) {
//            cartItems.append(product)
//        }
//    }
//    
//    func removeFromCart(_ product: Productproduct) {
//        cartItems.removeAll { $0.id == product.id }
//    }
//}

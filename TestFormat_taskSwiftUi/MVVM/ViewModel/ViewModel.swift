//
//  ViewModel.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import Foundation
import SwiftUI


struct CategoryItem: Identifiable {
    let id = UUID()
    let name: String?
    let imageName: String?
}

// MARK: - ViewModel
class HomeViewModel: ObservableObject {
    
    let apiService = APIService()
    @Published var productArray: [Product] = [Product]()
    @State  var iserror = false
    var errorMessage: String?
    
    
    @Published var categories: [CategoryItem] = [
        CategoryItem(name: "Phones", imageName: "apple"),
        CategoryItem(name: "Consoles", imageName: "joystick"),
        CategoryItem(name: "Laptops", imageName: "apple-laptop-computer"),
        CategoryItem(name: "Cameras", imageName: "dslr-camera"),
        CategoryItem(name: "Audio", imageName: "headphones-2"),
        //CategoryItem(name: "Audio", imageName: "wishlist"),
        //CategoryItem(name: "Audio", imageName: "wishlist"),
        //CategoryItem(name: "Audio", imageName: "wishlist")
    ]
    
    
    @Published var categoriesImages = ["wishlist", "right-chevron", "notification-bell-2", "magnifying-glass-2", "magnifying-glass-2"]
    @Published var flashSaleItems = []
    
    
    func Apicalling(){
        
        apiService.fetchProducts { [self] products, error in
            if let error = error {
                print("Error fetching products: \(error)")
                errorMessage = "\(error)"
                iserror = true
            } else if let products = products {
                print("\(products)")
                for product in products {
                    productArray.append(product)
                }
            }
        }
        
    }
}

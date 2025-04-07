//
//  ProductDetailViewModel.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import Foundation

// MARK: - ViewModel
class ProductDetailViewModel: ObservableObject {
    @Published var product: Product

    init(product: Product) {
        self.product = product
    }
    
    
    
    
    
}

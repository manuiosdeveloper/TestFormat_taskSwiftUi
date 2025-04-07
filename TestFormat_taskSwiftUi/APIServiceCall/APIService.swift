//
//  APIService.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 04/04/25.
//

import Foundation



class APIService {
    func fetchProducts(completion: @escaping ([Product]?, Error?) -> Void) {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            completion(nil, NSError(domain: "Invalid URL", code: -1, userInfo: nil))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Error handling
            if let error = error {
                completion(nil, error)
                return
            }

            // Decode the data
            if let data = data {
                do {
                    let products = try JSONDecoder().decode([Product].self, from: data)
                    completion(products, nil)
                } catch let decodeError {
                    completion(nil, decodeError)
                }
            }
        }

        task.resume()
    }
}

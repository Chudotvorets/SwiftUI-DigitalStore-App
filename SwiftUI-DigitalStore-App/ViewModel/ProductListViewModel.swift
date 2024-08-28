 //
//  ProductListViewModel.swift
//  SwiftUI-DigitalStore-App
//
//  Created by dev on 26.08.2024.
//

import Foundation

class ProductListViewObject: ObservableObject {
    @Published var products: [ProductModel]?
//    @Publisher var isLOading: Bool
//    @Publisher var error: NSError?
    
    var productInjection: [ProductModel] {
        var model: [ProductModel] = []
        if let products = self.products {
            if products.count >= 6 {
                model = products[0...5].shuffled()
            }
        }
        return model
    }
//    func loadProducts(with url: ProductListEndpoint){
//        self.products = nil
//        DispatchQueue.main.async {
//            self.isLoading = true
//        }
//        productListServices.fetchProducts(from: url) { (result) in
//            DispatchQueue.main.async {
//                self.isLoading = true
//            }
//            switch result {
//            case .success(let response):
//                DispatchQueue.main.async {
//                    self.products = response
//                    self.isLoading = false
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self.error = error as NSError
//                    print(error.localizedDescription)
//                }
//            }
//        }
   }

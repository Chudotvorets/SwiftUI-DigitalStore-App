 //
//  ProductListViewModel.swift
//  SwiftUI-DigitalStore-App
//
//  Created by dev on 26.08.2024.
//

import Foundation

class  ProductsListObject: ObservableObject {
    @Published var products: [ProductModel]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    var featuredProduct : [ProductModel] {
        var fProducts: [ProductModel] = []
        if let products = self.products  {
            if products.count >= 18 {
            fProducts = products[0...18].shuffled()
            }
        }
        return fProducts
    }
    
    /// Getting the api services singleton
    private let productListServices: APIServicesProtocol
    
    init(productServices: APIServicesProtocol = APIServices.shared) {
        self.productListServices = productServices
    }
    
    /// Call the api services to get the product needed
    /// - Parameter url: category of products
    func loadProducts(with url: ProductListEndpoint){
        self.products = nil
        DispatchQueue.main.async {
            self.isLoading = true
        }
        productListServices.fetchProducts(from: url) { (result) in
            DispatchQueue.main.async {
                self.isLoading = true
            }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.products = response
                    self.isLoading = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error as NSError
                    print(error.localizedDescription)
                }
            }
        }
    }
}


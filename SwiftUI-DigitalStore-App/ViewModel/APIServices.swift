//
//  APIService.swift
//  SwiftUI-DigitalStore-App
//
//  Created by dev on 29.08.2024.
//

import Foundation

protocol APIServicesProtocol {
    func fetchProducts(from endpoint: ProductListEndpoint, completion: @escaping (Result<[ProductModel], APICallError>) -> ())
    func fetchUser(completion: @escaping (Result<UserAPIResults, APICallError>) -> ())
}

class APIServices: APIServicesProtocol {
    
    static let shared = APIServices()
    private let baseURL = "https://fakestoreapi.com/products"
    private let userURL = "https://randomuser.me/api/"
    private let apiCall = URLSession.shared
    
    
    func fetchProducts(from endpoint: ProductListEndpoint, completion: @escaping (Result<[ProductModel], APICallError>) -> ()) {
        <#code#>
    }
    
    func fetchUser(completion: @escaping (Result<UserAPIResults, APICallError>) -> ()) {
        <#code#>
    }
    
    
}

enum ProductListEndpoint: String, CaseIterable {
    
    case all = "All"
    case jewelery = "Jewelery"
    case electronics = "electronics"
    case men = "men's clothing"
    case women = "women's clothing"
    
    var description: String {
        switch self {
        case .all: return "/"
        case .jewelery: return "/category/jewelery"
        case .electronics: return "/category/electronics"
        case .men: return "/category/men's%20clothing"
        case .women: return "/category/women's%20clothing"
        }
    }
}
enum APICallError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case noData
    case invalidResponse
    case decodingError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .decodingError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}

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
    
    /// /// Использование конечной точки списка продуктов для создания правильной конечной точки api
        /// - Параметры:
        /// - конечная точка: категория продукта, к которой нам нужен доступ
        /// - завершение: возврат необходимых данных
    
    func fetchProducts(from endpoint: ProductListEndpoint, completion: @escaping (Result<[ProductModel], APICallError>) -> ()) {
        guard let url = URL(string: "\(baseURL)\(endpoint.description)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        loadURLAndDecode(url: url, completion: completion)
    }
    func fetchUser(completion: @escaping (Result<UserAPIResults, APICallError>) -> ()) {
        guard let url = URL(string: "\(userURL)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        loadURLAndDecode(url: url, completion: completion)
    }
    
}

extension APIServices {
    
    // Вызываем конечную точку api и декодируем возвращаемые ею данные
        // - Параметры:
        /// - url: url-адрес вызова api с ключом api, если это необходимо
        /// - /// - параметры: компоненты url, в основном необходимый html-заголовок
        /// - завершение: передача данных с помощью завершения
        /// - Возвращает: декодированные данные или ошибку конечной точки API
    ///
    private func loadURLAndDecode<T: Decodable>(url: URL, parameters: [String: String]? = nil, completion: @escaping (Result<T, APICallError>)-> ()){
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        guard let finalURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        apiCall.dataTask(with: finalURL){ (data, response, error) in
            
            if error != nil {
                completion(.failure(.apiError))
            }
            guard let urlResponse = response as? HTTPURLResponse, 200..<300 ~= urlResponse.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
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

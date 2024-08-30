//
//  Model.swift
//  SwiftUI-DigitalStore-App
//
//  Created by dev on 26.08.2024.
//

import Foundation

struct ProductModel:  Hashable, Decodable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
}

extension ProductModel {
    var imageURL: URL {
        URL(string: image)!
    }
    var formatedRating: String {
        var result = ""
        for _ in 0...Int(rating.rate){
            result.append("★")
        }
        while result.count<5{
            result += "☆"
        }
        return result
    }
}

struct Rating: Codable, Hashable {
    let rate: Double
    // to remplace with let count when the api bug is fixed
    // let count: Int
    var manualCount: Int = Int.random(in: 0...500)
}

extension ProductModel {
    static var sampleProducts: [ProductModel] {
        let response: [ProductModel]? = try? Bundle.main.loadAndDecodeJSON(filename: "Promotional")
        return response ?? [ProductModel(id: 1, title: "noproduct", price: 10.5, description: "noproduct", category: "noproduct", image: "noproduct", rating: Rating(rate: 10.0))]
    }
}

//
//  UserModel.swift
//  SwiftUI-DigitalStore-App
//
//  Created by dev on 29.08.2024.
//

import Foundation

struct UserAPIResults: Codable {
    var results: [User]
    var info: APIInfo
}
struct User: Codable {
    var gender: String
    var name: Name
    var email: String
    var login: Login
    var picture: Picture
}
struct Name: Codable {
    var title: String
    var first: String
    var last: String
}

struct Coordinate: Codable {
    var latitude: String
    var longitude: String
}

struct Login: Codable {
    var uuid: String
    var username: String
    var password: String
}

struct APIInfo: Codable{
    var seed: String
    var results: Int
    var page: Int
    var version: String
}

struct Picture: Codable {
    var large: String
    var medium: String
    var thumbnail: String
}

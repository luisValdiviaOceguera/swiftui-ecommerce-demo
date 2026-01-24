//
//  Filters.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/12/26.
//
import Foundation

enum Department: String, Decodable, CaseIterable {
    case electronics
    case fashion
    case home
    case unknown

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self = Department(rawValue: value) ?? .unknown
    }
}


enum ProductCategory: String, Decodable, CaseIterable {
    case phones
    case audio
    case wearables
    case unknown

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self = ProductCategory(rawValue: value) ?? .unknown
    }
}

enum Brand: String, Decodable, CaseIterable {
    case apple
    case samsung
    case sony
    case unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self = Brand(rawValue: value) ?? .unknown
    }
}

enum PriceRange: String, CaseIterable {
    case low = "$"
    case medium = "$$"
    case high = "$$$"
}

//
//  Product.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/12/26.
//

import Foundation


struct Product: Decodable, Identifiable {
    let id: String?
    let name: String
    let price: Double?
    let regularPrice: Double?
    let image: String?
    let isFavorite: Bool?
    let currency: String?
    let department: Department?
    let category: ProductCategory?
    let brand: Brand?
    
    let description: String?
    let images: [String]?
    let specifications: [ProductSpecification]?
    let recommendations:CarouselSection?
    let newProducts:CarouselSection?
}
struct ProductsResponse: Decodable {
    let products: [Product]
}


struct ProductSpecification: Decodable, Identifiable {
    let id = UUID()
    let title: String
    let value: String
}

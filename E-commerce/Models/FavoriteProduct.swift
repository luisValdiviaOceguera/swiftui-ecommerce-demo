//
//  FavoriteProduct.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/24/26.
//
import Foundation

struct FavoriteProduct: Identifiable, Decodable {
    let id: String
    let name: String
    let price: Double
    let currency: String
    let image: String?
    let brand: String
    let isFavorite: Bool
}


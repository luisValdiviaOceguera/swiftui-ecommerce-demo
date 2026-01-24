//
//  FavoritesService.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/24/26.
//
import Foundation

protocol FavoritesServiceProtocol {
    func fetchFavorites() async throws -> [FavoriteProduct]
}

final class FavoritesService: FavoritesServiceProtocol {

    func fetchFavorites() async throws -> [FavoriteProduct] {
        let data = Data(mockFavoritesJSON.utf8)
        let response = try JSONDecoder().decode(FavoritesResponse.self, from: data)
        return response.favorites
    }
}


struct FavoritesResponse: Decodable {
    let favorites: [FavoriteProduct]
}

let mockFavoritesJSON = """
{
  "favorites": [
    {
      "id": "p1",
      "name": "iPhone 15 Pro",
      "price": 999,
      "currency": "USD",
      "image": "https://clevercel.mx/cdn/shop/files/3_ff67afe0-c89f-4a07-ab7d-c516de387a6f.jpg?v=1763065322&width=900",
      "brand": "Apple",
      "isFavorite": true
    },
    {
      "id": "p3",
      "name": "Apple Watch Series 9",
      "price": 299,
      "currency": "USD",
      "image": "https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/apple-watch-series-9.png",
      "brand": "Apple",
      "isFavorite": true
    }
  ]
}

"""

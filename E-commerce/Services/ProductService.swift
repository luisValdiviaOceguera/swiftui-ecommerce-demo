//
//  ProductService.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/12/26.
//
import Foundation

protocol ProductServicing {
    func fetchProducts() async throws -> ProductsResponse
}

final class ProductService: ProductServicing {

    func fetchProducts() async throws -> ProductsResponse {
        let data = Data(mockProductsJSON.utf8)
        return try JSONDecoder().decode(ProductsResponse.self, from: data)
    }
}

let mockProductsJSON = """
{
  "products": [
    {
      "id": "p1",
      "name": "iPhone 15 Pro",
      "price": 299,
      "regularPrice": 299,
      "currency": "USD",
      "image": "iphone15pro",
      "isFavorite": false,
      "department": "electronics",
      "category": "phones",
      "brand": "apple"
    },
    {
      "id": "p2",
      "name": "AirPods Pro",
      "price": 199,
      "regularPrice": 299,
      "currency": "USD",
      "image": "airpodspro",
      "isFavorite": true,
      "department": "electronics",
      "category": "phones",
      "brand": "apple"
    },
    {
      "id": "p3",
      "name": "Apple Watch Series 9",
      "price": 999,
      "regularPrice": 299,
      "currency": "USD",
      "image": "applewatch9",
      "isFavorite": false,
      "department": "electronics",
      "category": "phones",
      "brand": "apple"
    }
  ]
}
"""

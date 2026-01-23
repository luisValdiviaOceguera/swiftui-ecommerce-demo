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
      "image": "https://icon.co.cr/cdn/shop/files/IMG-14858971_064547b2-88b7-453e-8fc5-601bb7aa33af.jpg?v=1729269499",
      "isFavorite": false,
      "department": "electronics",
      "category": "phones",
      "brand": "apple",
    },
    {
      "id": "p2",
      "name": "AirPods Pro",
      "price": 199,
      "regularPrice": 299,
      "currency": "USD",
      "image": "https://i5.walmartimages.com/seo/Apple-AirPods-Pro-with-MagSafe-Charging-Case-1st-Generation_93aa61db-93b6-4b82-82ad-5f7ec0786d00.1498af75a12946b85050ac177b05bf0c.jpeg?odnHeight=2000&odnWidth=2000&odnBg=FFFFFF",
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
      "image": "https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/apple-watch-series-9.png",
      "isFavorite": false,
      "department": "electronics",
      "category": "phones",
      "brand": "apple"
    },
    {
    "id": "f1",
    "name": "Men's Slim Fit Denim Jacket",
    "price": 79,
    "regularPrice": 99,
    "currency": "USD",
    "image": "https://i.ebayimg.com/images/g/JasAAOSwQ4FkopNB/s-l1600.jpg",
    "isFavorite": false,
    "department": "fashion",
    "category": "mens_clothing",
    "brand": "levis"
  },
  {
    "id": "f2",
    "name": "Women's Casual Summer Dress",
    "price": 59,
    "regularPrice": 79,
    "currency": "USD",
    "image": "https://www.net-a-porter.com/variants/images/46376663163011717/in/w2000_q80.jpg",
    "isFavorite": false,
    "department": "fashion",
    "category": "womens_clothing",
    "brand": "zara"
  },
  {
    "id": "f3",
    "name": "Unisex Running Sneakers",
    "price": 120,
    "regularPrice": 150,
    "currency": "USD",
    "image": "https://images.ctfassets.net/hnk2vsx53n6l/1cGuCucrb3k9TYoREh2ipW/75804faaf0cdefcd29bac30a91946158/6e66c4a86161e3d133c432be906fee578df2b919.png?w=4000&h=4000&fm=avif&f=center&fit=fill&q=80",
    "isFavorite": false,
    "department": "fashion",
    "category": "shoes",
    "brand": "nike"
  },
  {
    "id": "f4",
    "name": "Leather Crossbody Bag",
    "price": 89,
    "regularPrice": 119,
    "currency": "USD",
    "image": "https://buffalojackson.com/cdn/shop/products/Roosevelt_Buffalo_Leather_Satchel_Messenger_Bag_Large_Dark_Oak_1-copy_2000x.jpg?v=1571710380",
    "isFavorite": false,
    "department": "fashion",
    "category": "accessories",
    "brand": "coach"
  },
    {
    "id": "h1",
    "name": "Modern Table Lamp",
    "price": 45,
    "regularPrice": 65,
    "currency": "USD",
    "image": "https://cdn11.bigcommerce.com/s-42eba/images/stencil/1280x1280/products/13557/136550/LMP_12865_26227_C__05145.1728598815.jpg?c=2",
    "isFavorite": false,
    "department": "home",
    "category": "lighting",
    "brand": "ikea"
  },
  {
    "id": "h2",
    "name": "Ceramic Dinnerware Set (12 pcs)",
    "price": 99,
    "regularPrice": 129,
    "currency": "USD",
    "image": "https://gibsonhomewares.com/cdn/shop/products/141350.16RSKE16PCDINNERWARESETSEAGLOSSYTWOTONEFINECERAMICPA105222001.jpg?v=1751311841&width=1200",
    "isFavorite": false,
    "department": "home",
    "category": "kitchen",
    "brand": "corelle"
  },
  {
    "id": "h3",
    "name": "Memory Foam Pillow",
    "price": 39,
    "regularPrice": 55,
    "currency": "USD",
    "image": "https://m.media-amazon.com/images/I/61nDBbaLv8L._AC_SL1500_.jpg",
    "isFavorite": false,
    "department": "home",
    "category": "bedroom",
    "brand": "tempur"
  },
  {
    "id": "h4",
    "name": "Minimalist Wall Clock",
    "price": 29,
    "regularPrice": 45,
    "currency": "USD",
    "image": "https://zenqdesigns.com/cdn/shop/products/HTB1Qa1IbirxK1RkHFCcq6AQCVXas-827333.jpg?v=1650724581",
    "isFavorite": false,
    "department": "home",
    "category": "decor",
    "brand": "umbra"
  }
  ]
}
"""

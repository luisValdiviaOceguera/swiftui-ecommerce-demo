//
//  ProductDetailService.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/22/26.
//
import Foundation

protocol ProductDetailServiceProtocol {
    func fetchProductDetail(id: String) async throws -> Product
}


final class MockProductDetailService: ProductDetailServiceProtocol {

    func fetchProductDetail(id: String) async throws -> Product {
        let data = Data(mockProductsDetailJSON.utf8)
        return try JSONDecoder().decode(Product.self, from: data)
    }
}

let mockProductsDetailJSON = """
    {
      "id": "p3",
      "name": "Apple Watch Series 9",
      "price": 299,
      "regularPrice": 399,
      "currency": "USD",
      "image": "https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/apple-watch-series-9.png",
      "isFavorite": false,
      "department": "electronics",
      "category": "wearables",
      "brand": "apple",
      "description": "El Apple Watch Series 9 combina potencia, diseño y tecnología avanzada para acompañarte en tu día a día. Su nueva generación de sensores y procesador ofrece un rendimiento más rápido y una experiencia mucho más fluida en cada interacción.",
      "images": [
        "https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/apple-watch-series-9.png",
        "applewatch9_2",
        "applewatch9_3"
      ],
      "specifications": [
        { "title": "Pantalla", "value": "Retina Always-On" },
        { "title": "Batería", "value": "Hasta 18 horas" },
        { "title": "Resistencia", "value": "Resistente al agua 50m" }
      ],
      "recommendations":{
          "items":[
        {
          "id": "p10",
          "name": "Apple Watch SE",
          "price": 249,
          "regularPrice": 279,
          "currency": "USD",
          "image": "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/MXLN3ref_VW_34FR+watch-case-42-aluminum-rosegold-cell-s11_VW_34FR+watch-face-42-aluminum-rosegold-s11_VW_34FR?wid=5120&hei=3280&bgc=fafafa&trim=1&fmt=p-jpg&qlt=80&.v=UVJuZDErT1V3TUlNcnk2Rnd0N1k2cDNqbENGcEFFTlJVaXJwL2VzdGxEM3hoaFEySTlrZSsrbEhqczIxajV3M3RTZmMrNW41eDRGZFFnZnhuRG8yNTNSRlE2a2xVdG1FZEh6Y2lYWXFUR0dTOHF1TWNGMHI2a1hyOG81U1FzSG91WDUzRk5ZVEdDZHJvOXEyblpIeEhKRnZGUUdUeGtYN2gySi9ZaWRpZitLckJnajVCaGRzU0pBREM1Q082Uk51NXVkZ2t0VWxQK2o2M01obVdMRmRjaWtoNFZVWXpYbXNERitnZ1pnSEoyUWE5Slh4U0lQMEFqd1lWQUZKWmlFKw",
          "isFavorite": false,
          "department": "electronics",
          "category": "wearables",
          "brand": "apple"
        },
        {
          "id": "p11",
          "name": "AirPods Pro",
          "price": 199,
          "regularPrice": 249,
          "currency": "USD",
          "image": "https://i5.walmartimages.com/seo/Apple-AirPods-Pro-with-MagSafe-Charging-Case-1st-Generation_93aa61db-93b6-4b82-82ad-5f7ec0786d00.1498af75a12946b85050ac177b05bf0c.jpeg?odnHeight=2000&odnWidth=2000&odnBg=FFFFFF",
          "isFavorite": false,
          "department": "electronics",
          "category": "audio",
          "brand": "apple"
        },
        {
            "id": "p12",
            "name": "iphone 15 pro",
            "price": 599,
            "regularPrice": 649,
            "currency": "USD",
            "image": "https://clevercel.mx/cdn/shop/files/3_ff67afe0-c89f-4a07-ab7d-c516de387a6f.jpg?v=1763065322&width=900",
            "isFavorite": false,
            "department": "electronics",
            "category": "audio",
            "brand": "apple"
        }
      ]
    },
    "newProducts":{
          "items":[
        {
          "id": "p12",
          "name": "iPhone 15",
          "price": 799,
          "regularPrice": 899,
          "currency": "USD",
          "image": "https://icon.co.cr/cdn/shop/files/IMG-14858971_064547b2-88b7-453e-8fc5-601bb7aa33af.jpg?v=1729269499",
          "isFavorite": false,
          "department": "electronics",
          "category": "phones",
          "brand": "apple"
        },
        {
          "id": "p13",
          "name": "Airpods Max",
          "price": 799,
          "regularPrice": 899,
          "currency": "USD",
          "image": "https://webobjects2.cdw.com/is/image/CDW/8073957?$product-detail$",
          "isFavorite": false,
          "department": "electronics",
          "category": "wearables",
          "brand": "apple"
        },
            {
              "id": "p14",
              "name": "Apple Macbook",
              "price": 799,
              "regularPrice": 849,
              "currency": "USD",
              "image": "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/macbook-air-13-digitalmat-gallery-1-202503?wid=728&hei=666&fmt=png-alpha&.v=RWZDcE1Pa2MvREpxR2hwendCZFpRa2EvQmI5ZjZseVhPSEJZVkYxZ09JdFpUdXE4MkhYYjRLTVptRHE3NGNZdHhaVXN2UmVLZWxyY01GTDZmcDYxbitZbnd2dEloRUI0QkxmQVJESllzWlN5ekw2b3VPdnZLWU14ZXc2aDkvRXI",
              "isFavorite": false,
              "department": "electronics",
              "category": "audio",
              "brand": "apple"
            }
      ]
       }
    
    }
    
    """

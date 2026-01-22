//
//  CategoriesServicing.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/19/26.
//

import Foundation

protocol CategoriesServicing {
    func fetchCategories() async throws -> [Category]
}

final class CategoriesService: CategoriesServicing {
    func fetchCategories() async throws -> [Category] {
        let data = Data(mockCategoriesJSON.utf8)
        let response = try JSONDecoder().decode(CategoriesResponse.self, from: data)
        return response.categories
    }
}


let mockCategoriesJSON = """
{
  "categories": [
    {
      "id": "1",
      "name": "Electronics",
      "children": [
        {
          "id": "1-1",
          "name": "Mobile Phones",
          "children": [
            {
              "id": "1-1-1",
              "name": "Smartphones",
              "children": [
                { "id": "1-1-1-1", "name": "Android Phones" },
                { "id": "1-1-1-2", "name": "iPhones" }
              ]
            },
            { "id": "1-1-2", "name": "Feature Phones" }
          ]
        },
        {
          "id": "1-2",
          "name": "Computers",
          "children": [
            {
              "id": "1-2-1",
              "name": "Laptops",
              "children": [
                { "id": "1-2-1-1", "name": "Gaming Laptops" },
                { "id": "1-2-1-2", "name": "Ultrabooks" },
                { "id": "1-2-1-3", "name": "MacBooks" }
              ]
            },
            {
              "id": "1-2-2",
              "name": "Desktops",
              "children": [
                { "id": "1-2-2-1", "name": "All-in-One PCs" },
                { "id": "1-2-2-2", "name": "Gaming PCs" }
              ]
            }
          ]
        },
        {
          "id": "1-3",
          "name": "TV & Home Entertainment",
          "children": [
            { "id": "1-3-1", "name": "Smart TVs" },
            { "id": "1-3-2", "name": "Streaming Devices" },
            { "id": "1-3-3", "name": "Soundbars" }
          ]
        },
        {
          "id": "1-4",
          "name": "Wearables",
          "children": [
            { "id": "1-4-1", "name": "Smartwatches" },
            { "id": "1-4-2", "name": "Fitness Trackers" }
          ]
        }
      ]
    },
    {
      "id": "2",
      "name": "Home & Kitchen",
      "children": [
        {
          "id": "2-1",
          "name": "Kitchen Appliances",
          "children": [
            { "id": "2-1-1", "name": "Microwaves" },
            { "id": "2-1-2", "name": "Blenders" },
            { "id": "2-1-3", "name": "Coffee Makers" }
          ]
        },
        {
          "id": "2-2",
          "name": "Furniture",
          "children": [
            { "id": "2-2-1", "name": "Sofas" },
            { "id": "2-2-2", "name": "Beds" },
            { "id": "2-2-3", "name": "Dining Tables" }
          ]
        },
        {
          "id": "2-3",
          "name": "Home Decor",
          "children": [
            { "id": "2-3-1", "name": "Wall Art" },
            { "id": "2-3-2", "name": "Lighting" },
            { "id": "2-3-3", "name": "Rugs" }
          ]
        }
      ]
    },
    {
      "id": "3",
      "name": "Fashion",
      "children": [
        {
          "id": "3-1",
          "name": "Men",
          "children": [
            {
              "id": "3-1-1",
              "name": "Clothing",
              "children": [
                { "id": "3-1-1-1", "name": "T-Shirts" },
                { "id": "3-1-1-2", "name": "Jeans" },
                { "id": "3-1-1-3", "name": "Jackets" }
              ]
            },
            {
              "id": "3-1-2",
              "name": "Shoes",
              "children": [
                { "id": "3-1-2-1", "name": "Sneakers" },
                { "id": "3-1-2-2", "name": "Formal Shoes" }
              ]
            }
          ]
        },
        {
          "id": "3-2",
          "name": "Women",
          "children": [
            {
              "id": "3-2-1",
              "name": "Clothing",
              "children": [
                { "id": "3-2-1-1", "name": "Dresses" },
                { "id": "3-2-1-2", "name": "Blouses" },
                { "id": "3-2-1-3", "name": "Skirts" }
              ]
            },
            {
              "id": "3-2-2",
              "name": "Shoes",
              "children": [
                { "id": "3-2-2-1", "name": "Heels" },
                { "id": "3-2-2-2", "name": "Flats" }
              ]
            }
          ]
        }
      ]
    },
    {
      "id": "4",
      "name": "Sports & Outdoors",
      "children": [
        {
          "id": "4-1",
          "name": "Fitness",
          "children": [
            { "id": "4-1-1", "name": "Dumbbells" },
            { "id": "4-1-2", "name": "Treadmills" },
            { "id": "4-1-3", "name": "Yoga Mats" }
          ]
        },
        {
          "id": "4-2",
          "name": "Outdoor Recreation",
          "children": [
            { "id": "4-2-1", "name": "Camping Gear" },
            { "id": "4-2-2", "name": "Bicycles" }
          ]
        }
      ]
    }
  ]
}
"""

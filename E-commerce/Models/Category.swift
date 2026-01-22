//
//  Category.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/19/26.
//

struct Category: Identifiable, Decodable {
    let id: String
    let name: String
    let children: [Category]?
}

struct CategoriesResponse: Decodable {
    let categories: [Category]
}

extension Category {
    var isLeaf: Bool {
        children == nil || children!.isEmpty
    }
}

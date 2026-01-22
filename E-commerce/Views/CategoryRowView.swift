//
//  CategoryRowView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/19/26.
//
import SwiftUI

struct CategoryRowView: View {

    let category: Category

    var body: some View {
        if let children = category.children {
            DisclosureGroup(category.name) {
                ForEach(children) { child in
                    CategoryRowView(category: child)
                        .padding(.leading, 8)
                }
            }
        } else {
            Text(category.name)
                .padding(.vertical, 4)
        }
    }
}

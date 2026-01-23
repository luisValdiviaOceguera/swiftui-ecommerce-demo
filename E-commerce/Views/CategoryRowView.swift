//
//  CategoryRowView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/19/26.
//
import SwiftUI

struct CategoryRowView: View {

    let category: Category
    let onLeafTap: () -> Void

    var body: some View {
        if let children = category.children, !children.isEmpty {
            DisclosureGroup(category.name) {
                ForEach(children) { child in
                    CategoryRowView(
                        category: child,
                        onLeafTap: onLeafTap
                    )
                    .padding(.leading, 8)
                }
            }
        } else {
            Button {
                onLeafTap()
            } label: {
                Text(category.name)
            }
        }
    }
}

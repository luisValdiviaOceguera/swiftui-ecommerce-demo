//
//  CategoryGridView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/10/26.
//

import SwiftUI

struct CategoryGridView: View {
    let title: String?
    let section: CategoryGridSection
    

    @State private var isExpanded = false

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    private var visibleItems: [Product] {
        if isExpanded {
            return section.items
        } else {
            return Array(section.items.prefix(6))
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let title {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
            }
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(visibleItems) { product in
                    CategoryGridItemView(product: product)
                }
            }

            if section.items.count > 6{
                Button {
                    withAnimation(.easeInOut) {
                        isExpanded.toggle()
                    }
                } label: {
                    Text(isExpanded ? "Ver menos" : "Ver más")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal)
    }
}

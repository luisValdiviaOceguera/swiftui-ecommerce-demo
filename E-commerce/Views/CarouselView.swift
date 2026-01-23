//
//  CarouselView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/7/26.
//

import SwiftUI

struct CarouselView: View {

    let title: String?
    let section: CarouselSection
    let onProductTap: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            // Title
            if let title {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(section.items) { product in
                        ProductCardView(product: product, onProductTap:onProductTap)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

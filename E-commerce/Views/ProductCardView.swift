//
//  ProductCardView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/7/26.
//
import SwiftUI
struct ProductCardView: View {

    let product: Product
    private let imageSize: CGFloat = 140

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {

            // Product image
            AsyncImage(url: URL(string: product.image ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: imageSize, height: imageSize)

                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageSize, height: imageSize)
                        .cornerRadius(10)

                case .failure:
                    Color.gray
                        .frame(width: imageSize, height: imageSize)
                        .overlay(
                            Image(systemName: "photo")
                        )
                        .cornerRadius(10)

                @unknown default:
                    EmptyView()
                }
            }

            // Name
            Text(product.name)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)

            // Price
            if let price = product.price {
                Text("$\(price, specifier: "%.2f")")
                    .font(.footnote)
                    .fontWeight(.bold)
            }
        }
        .frame(width: imageSize)
    }
}

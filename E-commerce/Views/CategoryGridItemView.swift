//
//  CategoryGridItemView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/10/26.
//
import SwiftUI

struct CategoryGridItemView: View {

    let product: Product

    var body: some View {
        VStack(spacing: 8) {

            AsyncImage(url: URL(string: product.image ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 120)

                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)

                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .foregroundColor(.gray)

                @unknown default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .cornerRadius(12)

            Text(product.name)
                .font(.footnote)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
    }
}

//
//  ProductRowView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/21/26.
//
import SwiftUI
struct ProductRowView: View {

    let product: Product
    private let imageSize: CGFloat = 120
    let onProductTap: (String) -> Void

    var body: some View {
        HStack(spacing: 16) {

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
                        .cornerRadius(12)

                default:
                    Color.gray
                        .frame(width: imageSize, height: imageSize)
                        .cornerRadius(12)
                }
            }

            VStack(alignment: .leading, spacing: 8) {

                Text(product.name)
                    .font(.headline)
                    .lineLimit(2)

                if let price = product.price {
                    Text("$\(price, specifier: "%.2f")")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading) // 👈 CLAVE
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
        .onTapGesture {
            onProductTap(product.id ?? "")
        }
    }
}

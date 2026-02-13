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
    let onProductTap: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {

            // 🖼 Imagen + botón bolsa
            ZStack(alignment: .topTrailing) {

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
                .onTapGesture {
                    onProductTap(product.id ?? "")
                }

                // 🛍 Botón sobre la imagen (top-right)
                Button {
                    // onAddToBag(product)
                } label: {
                    Image(systemName: "bag.fill")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                        //.padding(1)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                .padding(1)
            }

            // 💲 Nombre y precio
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(2)

                if let price = product.price,
                   let regularPrice = product.regularPrice {

                    if price < regularPrice {
                        HStack(spacing: 6) {
                            Text("$\(regularPrice, specifier: "%.2f")")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .strikethrough()

                            Text("$\(price, specifier: "%.2f")")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        }
                    } else {
                        Text("$\(price, specifier: "%.2f")")
                            .font(.footnote)
                            .fontWeight(.bold)
                    }

                } else if let price = product.price {
                    Text("$\(price, specifier: "%.2f")")
                        .font(.footnote)
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(radius: 2)
    }
}

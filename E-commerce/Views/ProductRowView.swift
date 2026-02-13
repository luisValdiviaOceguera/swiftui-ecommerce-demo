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
    //let onAddToBag: (Product) -> Void

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

            VStack(alignment: .leading, spacing: 6) {
                Text(product.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(2)

                // 💲 Precio
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

                // 🛍 Add to bag
                Button {
                    // onAddToBag(product)
                } label: {
                    Text("Add to bag")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 12)

            }

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
        .onTapGesture {
            onProductTap(product.id ?? "")
        }
    }
}

//
//  ProductDetailView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/22/26.
//
import SwiftUI

struct ProductDetailView: View {

    let productId: String
    @StateObject private var viewModel = ProductDetailViewModel()
    private let imageSize: CGFloat = 140
    let onProductTap: (String) -> Void

    var body: some View {
        ScrollView {
            if let product = viewModel.product {
                VStack(alignment: .leading, spacing: 16) {

                    // Imagen principal
                    AsyncImage(url: URL(string: product.image ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(maxWidth: .infinity, minHeight: 320)

                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, minHeight: 320)
                                .clipped()

                        case .failure:
                            Color.gray
                                .frame(maxWidth: .infinity, minHeight: 320)
                                .overlay(
                                    Image(systemName: "photo")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                )

                        @unknown default:
                            EmptyView()
                        }
                    }

                    // Nombre y precio
                    Text(product.name)
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("$\(product.price ?? 0, specifier: "%.2f") \(product.currency ?? "")")
                        .font(.title3)
                        .foregroundColor(.green)

                    // Descripción
                    if let description = product.description {
                        Text(description)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }

                    // Especificaciones
                    if let specs = product.specifications {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Especificaciones")
                                .font(.headline)

                            ForEach(specs) { spec in
                                HStack {
                                    Text(spec.title)
                                        .fontWeight(.medium)
                                    Spacer()
                                    Text(spec.value)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    if let recommendations = viewModel.product?.recommendations {
                        CarouselView(
                            title: "Recomendations for you",
                            section: recommendations,
                            onProductTap: onProductTap
                        )
                        .padding(.top, 20)
                    }
                    Spacer()
                    if let new = viewModel.product?.newProducts {
                        CarouselView(
                            title: "New products",
                            section: new,
                            onProductTap: onProductTap
                        )
                        .padding(.top, 20)
                    }
                }
                .padding()
            } else {
                ProgressView()
                    .padding(.top, 40)
            }
            
        }
        //.navigationTitle("Detalle")
        //.navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.load(productId: productId)
        }
    }
}

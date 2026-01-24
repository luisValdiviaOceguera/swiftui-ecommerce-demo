//
//  FavoritesView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/24/26.
//

import SwiftUI

struct FavoritesView: View {

    @StateObject private var viewModel = FavoritesViewModel()
    private let imageSize: CGFloat = 120
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else if viewModel.favorites.isEmpty {
                    emptyState
                } else {
                    favoritesList
                }
            }
            //.navigationTitle("Favoritos")
            .task {
                await viewModel.loadFavorites()
            }
        }
    }

    private var favoritesList: some View {
        List(viewModel.favorites) { product in
            HStack(alignment: .top, spacing: 12) {

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

                    Text("\(product.currency) \(product.price, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Button {
                        // Acción agregar a la bolsa
                    } label: {
                        Text("Add to bag")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }

                Spacer()

                Button {
                    viewModel.removeFavorite(id: product.id)
                } label: {
                    Image(systemName: "trash")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .buttonStyle(.plain)
            }
            .padding(.vertical, 8)
        }
        .listRowSpacing(16)

    }

    private var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "heart")
                .font(.largeTitle)
                .foregroundColor(.gray)

            Text("Aún no tienes favoritos")
                .font(.headline)

            Text("Guarda productos para verlos aquí más tarde")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

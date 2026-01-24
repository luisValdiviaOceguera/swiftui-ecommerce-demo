//
//  FavoritesViewModel.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/24/26.
//
import Foundation
internal import Combine

@MainActor
final class FavoritesViewModel: ObservableObject {

    @Published var favorites: [FavoriteProduct] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: FavoritesServiceProtocol

    init(service: FavoritesServiceProtocol = FavoritesService()) {
        self.service = service
    }

    func loadFavorites() async {
        isLoading = true
        defer { isLoading = false }

        do {
            favorites = try await service.fetchFavorites()
        } catch {
            errorMessage = "No se pudieron cargar los favoritos"
        }
    }
    func removeFavorite(id: String) {
            favorites.removeAll { $0.id == id }
        }
}

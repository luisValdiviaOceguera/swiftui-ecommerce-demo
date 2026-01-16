//
//  HomeViewModel.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 12/31/25.
//

import Foundation
internal import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published private(set) var sections: [HomeSection] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showCatalog = false

    private let service: HomeServicing

    init(service: HomeServicing = HomeService()) {
        self.service = service
    }

    func loadHome() async {
        isLoading = true
        defer { isLoading = false }

        do {
            sections = try await service.fetchHome().sections
        } catch {
            errorMessage = "Error loading home"
            print("❌ Error completo:", error)
        }
    }
    func goToCatalog() {
            showCatalog = true
        }
    func dismiss() {
        showCatalog = false
    }
}

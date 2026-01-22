//
//  BuyViewModel.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/19/26.
//
import Foundation
internal import Combine
@MainActor
final class BuyViewModel: ObservableObject {

    @Published var categories: [Category] = []

    private let service: CategoriesServicing

    init(service: CategoriesServicing = CategoriesService()) {
        self.service = service
        
    }

    func loadCategories() async {
        do {
            categories = try await service.fetchCategories()
        } catch {
            print("Error cargando categorías:", error)
        }
    }
}

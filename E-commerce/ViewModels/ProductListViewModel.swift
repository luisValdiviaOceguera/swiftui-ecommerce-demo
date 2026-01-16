//
//  ProductListViewModel.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/12/26.
//

import Foundation
internal import Combine

@MainActor
final class ProductListViewModel: ObservableObject {

    // Productos
    @Published private(set) var products: [Product] = []
    private var allProducts: [Product] = []

    // Estados
    @Published var isLoading = false
    @Published var errorMessage: String?

    // Filtros seleccionados
    @Published var selectedDepartment: Department?
    @Published var selectedCategory: ProductCategory?
    @Published var selectedPriceRange: PriceRange?
    @Published var selectedBrand: Brand?

    private let service: ProductServicing

    init(service: ProductServicing = ProductService()) {
        self.service = service
    }

    func fetchProducts() async {
        isLoading = true
        errorMessage = nil

        do {
            let response = try await service.fetchProducts()
            allProducts = response.products
            applyFilters()
        } catch {
            errorMessage = "Error al cargar productos"
        }

        isLoading = false
    }

    func applyFilters() {
        products = allProducts.filter { product in

            if let department = selectedDepartment,
               product.department != department {
                return false
            }

            if let category = selectedCategory,
               product.category != category {
                return false
            }

            if let brand = selectedBrand,
               product.brand != brand {
                return false
            }

            if let priceRange = selectedPriceRange {
                switch priceRange {
                case .low:
                    if product.price ?? 0 >= 5000 { return false }
                case .medium:
                    if product.price ?? 0 < 5000 || product.price ?? 0 > 15000 { return false }
                case .high:
                    if product.price ?? 0 <= 15000 { return false }
                }
            }

            return true
        }
    }

    // MARK: - Acciones desde la vista

    func select(department: Department) {
        selectedDepartment = department
        applyFilters()
    }

    func select(category: ProductCategory) {
        selectedCategory = category
        applyFilters()
    }

    func select(brand: Brand) {
        selectedBrand = brand
        applyFilters()
    }

    func select(priceRange: PriceRange) {
        selectedPriceRange = priceRange
        applyFilters()
    }

    func clearFilters() {
        selectedDepartment = nil
        selectedCategory = nil
        selectedBrand = nil
        selectedPriceRange = nil
        applyFilters()
    }
}


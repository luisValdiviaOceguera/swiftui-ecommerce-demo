//
//  ProductDetailViewModel.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/22/26.
//
import Foundation
internal import Combine

@MainActor
final class ProductDetailViewModel: ObservableObject {

    @Published var product: Product?
    @Published var isLoading = false

    private let service: ProductDetailServiceProtocol

    init(service: ProductDetailServiceProtocol = MockProductDetailService()) {
        self.service = service
    }

    func load(productId: String) async {
        isLoading = true
        defer { isLoading = false }

        do {
            product = try await service.fetchProductDetail(id: productId)
        } catch {
            print("Error loading product detail:", error)
        }
    }
}

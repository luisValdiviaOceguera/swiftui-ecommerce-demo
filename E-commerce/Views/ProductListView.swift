//
//  ProductListView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/12/26.
//

import SwiftUI

struct ProductListView: View {

    @StateObject private var viewModel = ProductListViewModel()

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {

            ZStack {

                if viewModel.isLoading {
                    ProgressView("Cargando productos...")
                }

                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {

                        // 🔎 Título de resultados
                        Text("Resultados de búsqueda")
                            .font(.title2)
                            .fontWeight(.bold)

                        // 🎛 Filtros
                        VStack(alignment: .leading, spacing: 8) {

                            Text("Filtrar por")
                                .font(.subheadline)
                                .fontWeight(.semibold)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(Department.allCases, id: \.self) { department in
                                        FilterButton(
                                            title: department.rawValue,
                                            isSelected: viewModel.selectedDepartment == department
                                        ) {
                                            viewModel.select(department: department)
                                        }
                                    }
                                }
                            }

                        }

                        // 🛍 Grid de productos
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.products) { product in
                                ProductCardView(product: product)
                            }
                        }
                    }
                    .padding()
                }
                .opacity(viewModel.isLoading ? 0 : 1)
            }
        
        .task {
            await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductListView()
}

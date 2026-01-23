//
//  ProductListView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/12/26.
//

import SwiftUI

enum ProductLayout {
    case grid
    case list
}

struct ProductListView: View {

    @StateObject private var viewModel = ProductListViewModel()
    @State private var layout: ProductLayout = .grid
    let onProductTap: (String) -> Void

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
                            HStack(spacing: 16) {
                                
                            Text("Filtrar por")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                
                                Spacer()
                                
                            Button {
                                    layout = layout == .grid ? .list : .grid
                                } label: {
                                    Image(systemName: layout == .grid ? "list.bullet" : "square.grid.2x2")
                                        .font(.title3)
                                }
                            }
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
                        Group {
                            if layout == .grid {
                                LazyVGrid(columns: columns, spacing: 16) {
                                    ForEach(viewModel.products) { product in
                                        ProductCardView(product: product, onProductTap: onProductTap)
                                    }
                                }
                            } else {
                                LazyVStack(spacing: 16) {
                                    ForEach(viewModel.products) { product in
                                        ProductRowView(product: product, onProductTap: onProductTap)
                                    }
                                }
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



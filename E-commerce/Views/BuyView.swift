//
//  BuyView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/19/26.
//
import SwiftUI

struct BuyView: View {

    @StateObject private var viewModel = BuyViewModel()

    var body: some View {
        List {
            ForEach(viewModel.categories) { category in
                CategoryRowView(category: category)
            }
        }
        .listStyle(.insetGrouped)
        //navigationTitle("Comprar")
        .task {
            await viewModel.loadCategories()
        }
    }
}

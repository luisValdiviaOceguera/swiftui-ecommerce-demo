//
//  HeaderView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/10/26.
//
import SwiftUI

struct HeaderView: View {

    @Binding var searchText: String

    var body: some View {
        VStack(spacing: 12) {

            HStack(spacing: 12) {

                // Search
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)

                    TextField("Buscar productos", text: $searchText)
                        .textInputAutocapitalization(.none)
                }
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)

                // Icons
                HStack(spacing: 16) {
                    headerIcon("heart")
                    headerIcon("cart")
                    headerIcon("bell")
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
    }

    private func headerIcon(_ systemName: String) -> some View {
        Button {
            // acción futura
        } label: {
            Image(systemName: systemName)
                .font(.system(size: 18))
        }
    }
}

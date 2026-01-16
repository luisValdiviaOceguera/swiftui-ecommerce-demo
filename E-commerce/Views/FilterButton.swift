//
//  FilterButton.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/12/26.
//
import SwiftUI

struct FilterButton: View {

    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.footnote)
                .fontWeight(.medium)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    isSelected
                    ? Color.blue.opacity(0.2)
                    : Color(.systemGray6)
                )
                .cornerRadius(16)
        }
        .foregroundColor(isSelected ? .blue : .primary)
    }
}

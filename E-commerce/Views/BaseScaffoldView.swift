//
//  BaseScaffoldView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/10/26.
//

import SwiftUI

struct BaseScaffoldView<Content: View>: View {

    @ViewBuilder let content: Content
    @State private var searchText = ""

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(searchText: $searchText)

            Divider()

            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

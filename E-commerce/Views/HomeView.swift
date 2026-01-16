//
//  homeView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 12/31/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        BaseScaffoldView {
            NavigationStack {
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(viewModel.sections) { section in
                        HomeSectionFactory(section: section,onBannerTap: {
                            viewModel.goToCatalog()
                        })
                        Spacer()
                    }
                }
                .padding()
                
            }
            .task {
                await viewModel.loadHome()
            }
            .navigationDestination(isPresented: $viewModel.showCatalog) {
                ProductListView()
                    .navigationBarBackButtonHidden(true)
                
            }
        }
    }
    }
}

//
//  homeView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 12/31/25.
//

import SwiftUI

struct HomeView: View {

    let onGoToCatalog: () -> Void
    @StateObject private var viewModel = HomeViewModel()
    let onProductTap: (String) -> Void
    @EnvironmentObject private var appViewModel: AppViewModel
    @State private var showLoginSheet = false


    var body: some View {
        BaseScaffoldView {
            ScrollView {
                LazyVStack(spacing: 24) {
                    if !appViewModel.islogged(){
                        GuestSignupView(
                                    onSignInTap: {
                                        showLoginSheet = true
                                                }
                                        )
                    }
                    ForEach(viewModel.sections) { section in
                        HomeSectionFactory(
                            section: section,
                            onBannerTap: {
                                onGoToCatalog()
                            }, onProductTap: onProductTap
                        )
                    }
                }
                .ignoresSafeArea(.container, edges: .horizontal)
                
            }
            .task {
                await viewModel.loadHome()
            }
            .sheet(isPresented: $showLoginSheet) {
                LoginView()
                    .presentationDetents([.medium])
            }

        }
    }
}


//
//  RootView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 12/31/25.
//

import SwiftUI

struct RootView: View {
    @StateObject private var appViewModel = AppViewModel()

    var body: some View {
        switch appViewModel.route {
        case .splash:
            SplashView(viewModel: appViewModel)

        case .login:
            LoginView(appViewModel: appViewModel)

        case .home:
           // HomeView(viewModel: appViewModel)
           // HomeView()
            MainTabView()
        }
    }
}

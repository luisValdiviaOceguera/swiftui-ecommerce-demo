//
//  RootView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 12/31/25.
//

import SwiftUI

struct RootView: View {

    @EnvironmentObject private var appViewModel: AppViewModel

    var body: some View {
        switch appViewModel.route {
        case .splash:
            SplashView()
                .onAppear {
                    appViewModel.startApp()
                }

        case .login:
            LoginView()

        case .home:
            MainTabView()
        }
    }
}


//
//  AppViewModel.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 12/31/25.
//

import Foundation
internal import Combine
enum AppRoute {
    case splash
    case login
    case home
}

final class AppViewModel: ObservableObject {

    @Published var route: AppRoute = .splash
    private let sessionManager: SessionManaging

    init(sessionManager: SessionManaging = SessionManager()) {
        self.sessionManager = sessionManager
    }

    func startApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.route = self.sessionManager.isLoggedIn ? .home : .login
        }
    }

    func loginSuccess() {
        route = .home
    }

    func logout() {
        sessionManager.clearSession()
        route = .login
    }
}


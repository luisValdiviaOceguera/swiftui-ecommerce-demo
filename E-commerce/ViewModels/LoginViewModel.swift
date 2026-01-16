//
//  LoginViewModel.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/7/26.
//

import Foundation
internal import Combine

final class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let authService: AuthServicing
    private let sessionManager: SessionManaging

    init(
        authService: AuthServicing = AuthService(),
        sessionManager: SessionManaging = SessionManager()
    ) {
        self.authService = authService
        self.sessionManager = sessionManager
    }

    func login(completion: @escaping (Bool) -> Void) {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Campos obligatorios"
            return
        }

        isLoading = true
        errorMessage = nil

        Task {
            do {
                let token = try await authService.login(
                    email: email,
                    password: password
                )

                sessionManager.saveToken(token)

                await MainActor.run {
                    isLoading = false
                    completion(true)
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
    var isEmailValid: Bool {
        email.contains("@") && email.contains(".")
    }

    var isPasswordValid: Bool {
        password.count >= 6
    }

    var isFormValid: Bool {
        isEmailValid && isPasswordValid
    }

}


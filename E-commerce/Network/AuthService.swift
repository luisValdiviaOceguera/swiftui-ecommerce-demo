//
//  AuthService.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/7/26.
//
import Foundation

protocol AuthServicing {
    func login(
        email: String,
        password: String
    ) async throws -> String // token
}

final class AuthService: AuthServicing {

    func login(
        email: String,
        password: String
    ) async throws -> String {

        // Simulación API
        try await Task.sleep(nanoseconds: 1_500_000_000)

        if email == "test@test.com", password == "123456" {
            return "mock_jwt_token_123"
        } else {
            throw AuthError.invalidCredentials
        }
    }
}

enum AuthError: LocalizedError {
    case invalidCredentials

    var errorDescription: String? {
        "Correo o contraseña incorrectos"
    }
}



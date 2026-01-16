//
//  SessionManager.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/7/26.
//
import Foundation

protocol SessionManaging {
    var isLoggedIn: Bool { get }
    func saveToken(_ token: String)
    func clearSession()
}

final class SessionManager: SessionManaging {

    private let keychain: KeychainServicing
    private let tokenKey = "auth_token"

    init(keychain: KeychainServicing = KeychainService()) {
        self.keychain = keychain
    }

    var isLoggedIn: Bool {
        (try? keychain.read(key: tokenKey)) != nil
    }

    func saveToken(_ token: String) {
        try? keychain.save(token, for: tokenKey)
    }

    func clearSession() {
        try? keychain.delete(key: tokenKey)
    }
}


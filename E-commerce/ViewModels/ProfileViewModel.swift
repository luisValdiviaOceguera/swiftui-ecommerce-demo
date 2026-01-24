//
//  ProfileViewModel.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/24/26.
//
import Foundation
internal import Combine



@MainActor
final class ProfileViewModel: ObservableObject {

    let userName = "Luis Manuel"
        let userEmail = "luis@email.com"

        let options: [ProfileOption] = [
            ProfileOption(title: "My Account", systemImage: "person", route: .myAccount),
            ProfileOption(title: "Orders", systemImage: "bag", route: .orders),
            ProfileOption(title: "Change Password", systemImage: "key", route: .changePassword),
            ProfileOption(title: "Addresses", systemImage: "map", route: .addresses),
            ProfileOption(title: "Help & Support", systemImage: "questionmark.circle", route: .helpSupport),
            ProfileOption(title: "Terms & Conditions", systemImage: "doc.text", route: .terms)
        ]

    func handleSelection(_ option: ProfileOption) {
        // navegación o acción futura
        print("Seleccionó: \(option.title)")
    }

    func logout() {
        print("Cerrar sesión")
    }
    
}


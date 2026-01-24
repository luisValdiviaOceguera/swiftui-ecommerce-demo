//
//  ProfileOption.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/24/26.
//
import Foundation

struct ProfileOption: Identifiable {
    let id = UUID()
    let title: String
    let systemImage: String
    let route: ProfileRoute
}


enum ProfileRoute: Hashable {
    case myAccount
    case orders
    case changePassword
    case addresses
    case helpSupport
    case terms
}

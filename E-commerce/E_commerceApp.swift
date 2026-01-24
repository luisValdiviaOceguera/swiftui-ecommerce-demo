//
//  E_commerceApp.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 12/23/25.
//

import SwiftUI

@main
struct E_commerceApp: App {
    @StateObject private var appViewModel = AppViewModel()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appViewModel)
                .preferredColorScheme(.light)
            //MainTabView()
        }
    }
}

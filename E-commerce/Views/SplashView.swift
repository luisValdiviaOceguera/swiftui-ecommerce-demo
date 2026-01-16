//
//  SplashView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 12/31/25.
//

import SwiftUI

struct SplashView: View {
    let viewModel: AppViewModel

    var body: some View {
        VStack {
            Image("commerce-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
        .onAppear {
            viewModel.startApp()
        }
    }
}

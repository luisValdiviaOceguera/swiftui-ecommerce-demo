//
//  ContentView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 12/23/25.
//

import SwiftUI

struct ContentView: View {
    let image1 = UIImage(named: "Commerce-logo")
    var body: some View {
        MainTabView()
        VStack {
            Image("commerce-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

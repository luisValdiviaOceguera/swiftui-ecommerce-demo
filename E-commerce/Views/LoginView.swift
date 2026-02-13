//
//  LoginView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/7/26.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var appViewModel: AppViewModel
    @StateObject private var viewModel = LoginViewModel()
    @State private var appear = false
    @Environment(\.dismiss) private var dismiss


    var body: some View {
        VStack(spacing: 20) {
            Image("commerce-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(.bottom, -10)
                .transition(.scale)

            Text("Iniciar sesión")
                .font(.largeTitle)
                .bold()

            TextField("Correo electrónico", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .textFieldStyle(.roundedBorder)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(viewModel.email.isEmpty || viewModel.isEmailValid ? .clear : .red)
                )
            if !viewModel.email.isEmpty && !viewModel.isEmailValid {
                Text("Correo inválido")
                    .font(.caption)
                    .foregroundColor(.red)
            }


            SecureField("Contraseña", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }

            Button {
                viewModel.login { success in
                    if success {
                        appViewModel.loginSuccess()
                        dismiss()
                    }
                }
            } label: {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Entrar")
                        .frame(maxWidth: .infinity)
                        .bold()
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(!viewModel.isFormValid || viewModel.isLoading)
            .opacity(viewModel.isFormValid ? 1 : 0.6)
            
            Button {
                appViewModel.continueAsGuest() 
                dismiss()
            } label: {
                Text("Continue as Guest")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.top, 8)
            Spacer()
        }
        .opacity(appear ? 1 : 0)
        .offset(y: appear ? 0 : 20)
        .onAppear {
            withAnimation(.easeOut(duration: 0.6)) {
                appear = true
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}

//
//  ProfileView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/24/26.
//

import SwiftUI

struct ProfileView: View {

    @StateObject private var viewModel = ProfileViewModel()
    @State private var path: [ProfileRoute] = []
    @State private var showLogoutConfirmation = false
    @EnvironmentObject private var appViewModel: AppViewModel

    var body: some View {
        NavigationStack(path: $path) {
            List {

                // MARK: - Header
                Section {
                    VStack(spacing: 12) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 72))
                            .foregroundColor(.gray)

                        Text(viewModel.userName)
                            .font(.headline)

                        Text(viewModel.userEmail)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                }

                // MARK: - Options
                Section {
                    ForEach(viewModel.options) { option in
                        Button {
                            path.append(option.route)
                        } label: {
                            HStack(spacing: 12) {
                                Image(systemName: option.systemImage)
                                    .frame(width: 24)

                                Text(option.title)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                        .foregroundColor(.primary)
                    }
                }

                // MARK: - Logout
                Section {
                    Button {
                        showLogoutConfirmation = true
                    } label: {
                        Text("Log Out")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(.insetGrouped)
            //.navigationTitle("Profile")
            .confirmationDialog(
                "Are you sure you want to log out?",
                isPresented: $showLogoutConfirmation
            ) {
                Button("Log Out", role: .destructive) {
                    
                    appViewModel.logout()
                }
                Button("Cancel", role: .cancel) { }
            }
            .navigationDestination(for: ProfileRoute.self) { route in
                switch route {
                case .myAccount:
                    MyAccountView()
                case .orders:
                    OrdersView()
                case .changePassword:
                    ChangePasswordView()
                case .addresses:
                    AddressesView()
                case .helpSupport:
                    HelpSupportView()
                case .terms:
                    TermsView()
                }
            }
        }
    }
}


struct MyAccountView: View {
    var body: some View {
        Text("My Account")
            .navigationTitle("My Account")
    }
}

struct OrdersView: View {
    var body: some View {
        Text("Orders")
            .navigationTitle("Orders")
    }
}

struct ChangePasswordView: View {
    var body: some View {
        Text("Change Password")
            .navigationTitle("Change Password")
    }
}

struct AddressesView: View {
    var body: some View {
        Text("Addresses")
            .navigationTitle("Addresses")
    }
}

struct HelpSupportView: View {
    var body: some View {
        Text("Help & Support")
            .navigationTitle("Help & Support")
    }
}

struct TermsView: View {
    var body: some View {
        Text("Terms & Conditions")
            .navigationTitle("Terms & Conditions")
    }
}

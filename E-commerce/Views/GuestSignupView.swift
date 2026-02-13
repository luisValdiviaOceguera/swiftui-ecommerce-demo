//
//  GuestSignupView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 2/12/26.
//
import SwiftUI

struct GuestSignupView: View {
    let onSignInTap: () -> Void
    var body: some View {
        VStack(spacing: 20) {
            HStack(){
                
                
                // Texto principal
                VStack(spacing: 12) {
                    
                    Text("Become a member for\nrewards & perks!")
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.primary)
                }
                // Imagen 3D superior
//                Image("3dpig")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 180)
//                    .padding(.top, 32)
            }
            // Texto descriptivo
            Text("""
            Sign up for Rewards to earn FREE products and unlock other member perks like birthday surprises, sneak peeks and more.
            """)
            .font(.system(size: 12))
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 24)

            // Botones
            HStack() {

                Button(action: {
                    onSignInTap()
                }) {
                    Text("Sign in or join")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                Button(action: {
                    // Acción: Learn more
                }) {
                    Text("Learn more")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal, 20)

            //Spacer()
        }
    }
}


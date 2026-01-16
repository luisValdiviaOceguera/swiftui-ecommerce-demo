//
//  BannerSectionView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/7/26.
//
import SwiftUI

struct BannerSectionView: View {

    let title: String?
    let section: BannerSection
    let onTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

//            if let title {
//                Text(title)
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .padding(.horizontal)
//            }

            if let banner = section.items.first,
               let url = URL(string: banner.image) {

                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 550)
                            .frame(maxWidth: .infinity)

                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 650)
                            .frame(maxWidth: .infinity)

                    case .failure:
                        Color.gray
                            .frame(height: 550)
                            .overlay(
                                Image("commerce-logo")
                            )

                    @unknown default:
                        EmptyView()
                    }
                }.onTapGesture {
                    onTap()
                }
                .ignoresSafeArea(.container, edges: .horizontal)
            }
        }
    }
}

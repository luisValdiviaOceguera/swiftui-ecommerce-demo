//
//  HomeSectionFactory.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 12/31/25.
//

import SwiftUI

struct HomeSectionFactory: View {
    let section: HomeSection
    let onBannerTap: () -> Void

    var body: some View {
        switch section.items {
        case .banner(let model):
            BannerSectionView(
                        title: section.title,
                        section: model,
                        onTap: onBannerTap
                    ).ignoresSafeArea(.container, edges: .horizontal)

        case .carousel(let model):
            CarouselView(
                        title: section.title,
                        section: model
                    )

        case .categoryGrid(let model):
            CategoryGridView(title: section.title,
                             section: model)
            
        }
    }
}

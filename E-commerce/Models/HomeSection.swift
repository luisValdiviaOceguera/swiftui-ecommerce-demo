//
//  HomeSection.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 12/31/25.
//

struct HomeSection: Decodable, Identifiable {
    let id: String
    let componentType: ComponentType
    let title: String?
    let items: SectionData

    enum CodingKeys: String, CodingKey {
        case id, componentType, title, items
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        componentType = try container.decode(ComponentType.self, forKey: .componentType)
        title = try container.decodeIfPresent(String.self, forKey: .title)

        switch componentType {
        case .banner:
            let bannerItems = try container.decode([BannerItem].self, forKey: .items)
            items = .banner(BannerSection(items: bannerItems))
        case .carousel:
            let products = try container.decode([Product].self, forKey: .items)
            items = .carousel(CarouselSection(items: products))
        case .staticGrid:
            let categories = try container.decode([Product].self, forKey: .items)
            items = .categoryGrid(CategoryGridSection(items: categories))
        }
    }
}

enum ComponentType: String, Decodable {
    case banner
    case carousel
    case staticGrid = "static"
}


enum SectionData {
    case banner(BannerSection)
    case carousel(CarouselSection)
    case categoryGrid(CategoryGridSection)
}



struct BannerSection: Decodable {
    let items: [BannerItem]
}

struct BannerItem: Decodable {
    let image: String
}

struct CarouselSection: Decodable {
    let items: [Product]
}


struct CategoryGridSection: Decodable {
    let items: [Product]
    
}





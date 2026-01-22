//
//  TabView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/10/26.
//
import SwiftUI

enum TabItem: Hashable {
    case home
    case buy
    case favorites
    case profile
}

struct MainTabView: View {

    @State private var selectedTab: TabItem = .home
    @State private var lastSelectedTab: TabItem = .home
    @State private var buyRoute: BuyRoute = .root
    
    var tabSelection: Binding<TabItem> {
        Binding(
            get: { selectedTab },
            set: { newValue in
                if newValue == .buy && selectedTab == .buy {
                    // 👆 el usuario tocó el tab Buy estando ya en Buy
                    buyRoute = .root
                }
                selectedTab = newValue
            }
        )
    }


    var body: some View {
        TabView(selection: tabSelection) {

            HomeTab(
                onGoToCatalog: {
                    buyRoute = .productList
                    selectedTab = .buy
                }
            )
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(TabItem.home)

            BuyTab(route: buyRoute)
                .tabItem {
                    Label("Buy", systemImage: "bag")
                }
                .tag(TabItem.buy)

            FavoritesTab()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
                .tag(TabItem.favorites)

            ProfileTab()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(TabItem.profile)
        }
        
    }
}







struct HomeTab: View {

    let onGoToCatalog: () -> Void

    var body: some View {
        NavigationStack {
            HomeView(onGoToCatalog: onGoToCatalog)
        }
    }
}






struct BuyTab: View {

    let route: BuyRoute
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {

            content
                .navigationDestination(for: BuyRoute.self) { route in
                    switch route {
                    case .root:
                        BuyView()

                    case .productList:
                        ProductListView()

                    case .productDetail(let id):
                       // ProductDetailView(productId: id)
                        ProductListView()
                    }
                }
        }
        .onChange(of: route) { newRoute in
            path.removeLast(path.count)

            // 🚨 solo empujamos si NO es root
            if newRoute != .root {
                path.append(newRoute)
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch route {
        case .root:
            BaseScaffoldView {
                BuyView()
            }

        case .productList:
            BaseScaffoldView {
                ProductListView()
            }

        default:
            BaseScaffoldView {
                BuyView()
            }
        }
    }
}





struct FavoritesTab: View {
    var body: some View {
        BaseScaffoldView {
            Text("Favorites")
        }
    }
}


struct ProfileTab: View {
    var body: some View {
        BaseScaffoldView {
            Text("Profile")
        }
    }
}
enum BuyRoute: Hashable {
    case root
    case productList
    case productDetail(id: String)
}

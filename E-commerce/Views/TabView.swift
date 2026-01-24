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
                }, onProductTap: { id in
                    buyRoute = .productDetail(id: id)
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
    let onProductTap: (String) -> Void

    var body: some View {
        NavigationStack {
            HomeView(onGoToCatalog: onGoToCatalog, onProductTap: onProductTap)
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
                    case .productList:
                        ProductListView { productId in
                                path.append(BuyRoute.productDetail(id: productId))
                            }

                    case .productDetail(let id):
                        ProductDetailView(productId: id){id in 
                            path.append(BuyRoute.productDetail(id: id))
                        }

                    default:
                        EmptyView()
                    }
                }
        }
        .onChange(of: route) { newRoute in
            path.removeLast(path.count)
            if newRoute != .root {
                path.append(newRoute)
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        BaseScaffoldView {
            BuyView(
                onLeafCategoryTap: {
                    path.append(BuyRoute.productList)
                }
            )
        }
    }
}






struct FavoritesTab: View {
    var body: some View {
        BaseScaffoldView {
            FavoritesView()
        }
    }
}


struct ProfileTab: View {
    var body: some View {
        BaseScaffoldView {
            ProfileView()
        }
    }
}
enum BuyRoute: Hashable {
    case root
    case productList
    case productDetail(id: String)
}

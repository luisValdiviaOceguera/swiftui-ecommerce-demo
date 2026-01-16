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

    var body: some View {
        TabView(selection: $selectedTab) {

            HomeTab(selectedTab: $selectedTab)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(TabItem.home)

            BuyTab()
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

    @Binding var selectedTab: TabItem

    var body: some View {
           NavigationStack {
               HomeView()
           }
       }
}



struct BuyTab: View {
    var body: some View {
        BaseScaffoldView {
            Text("Buy")
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

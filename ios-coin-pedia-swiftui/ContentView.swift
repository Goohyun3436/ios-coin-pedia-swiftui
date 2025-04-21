//
//  ContentView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct ContentView: View {
    enum TabItem: CaseIterable {
        case home
        case search
        case storage
        case user
        
        var view: AnyView {
            switch self {
            case .home:
                AnyView(HomeView())
            case .search:
                AnyView(SearchView())
            case .storage:
                AnyView(StorageView())
            case .user:
                AnyView(UserView())
            }
        }
        
        var icon: String {
            switch self {
            case .home:
                "chart.bar"
            case .search:
                "magnifyingglass"
            case .storage:
                "wallet.pass"
            case .user:
                "person"
            }
        }
    }
    
    var body: some View {
        TabView {
            ForEach(TabItem.allCases, id: \.self) { tab in
                tab.view
                    .tabItem {
                        Image(systemName: tab.icon)
                    }
            }
        }
        .accentColor(.purple)
    }
}

#Preview {
    ContentView()
}

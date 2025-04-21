//
//  SearchView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct SearchView: View {
    @State private var query: String = ""
    @State private var coins: [CoinInfo] = []
    
    var body: some View {
        NavigationStack {
            mainView()
                .navigationTitle("Search")
        }
    }
    
    private func mainView() -> some View {
        VerticalScrollView {
            ForEach(coins, id: \.id) { coin in
                CoinFavoriteView(coin: coin)
            }
        }
        .padding(.vertical, 16)
        .asNavigationSearchable(
            text: $query,
            placeholder: "코인 검색",
            onSubmit: { query in
                Task {
                    await fetchSearch()
                }
            },
            onChange: { query in
                print(query)
            },
            initial: false
        )
    }
    
    private func fetchSearch() async {
        coins = coins
    }
}

#Preview {
    SearchView()
}

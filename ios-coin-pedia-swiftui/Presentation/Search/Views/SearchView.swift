//
//  SearchView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct SearchView: View {
    @State private var query: String = ""
    @State private var coins: [CoinInfo] = [
        CoinInfo(
            id: "btc",
            score: 1,
            name: "Bitcoin",
            symbol: "BTC",
            image: "https://cryptologos.cc/logos/bitcoin-btc-logo.png",
            price: 69234245,
            volatility: -0.64,
            isFavorite: true
        ),
        CoinInfo(
            id: "wbtc",
            score: 2,
            name: "Wrapped Bitcoin",
            symbol: "WBTC",
            image: "https://cryptologos.cc/logos/wrapped-bitcoin-wbtc-logo.png",
            price: 67886314,
            volatility: -2.73,
            isFavorite: true
        ),
        CoinInfo(
            id: "btc",
            score: 1,
            name: "Bitcoin",
            symbol: "BTC",
            image: "https://cryptologos.cc/logos/bitcoin-btc-logo.png",
            price: 69234245,
            volatility: -0.64,
            isFavorite: true
        ),
        CoinInfo(
            id: "wbtc",
            score: 2,
            name: "Wrapped Bitcoin",
            symbol: "WBTC",
            image: "https://cryptologos.cc/logos/wrapped-bitcoin-wbtc-logo.png",
            price: 67886314,
            volatility: -2.73,
            isFavorite: true
        ),
        CoinInfo(
            id: "btc",
            score: 1,
            name: "Bitcoin",
            symbol: "BTC",
            image: "https://cryptologos.cc/logos/bitcoin-btc-logo.png",
            price: 69234245,
            volatility: -0.64,
            isFavorite: true
        ),
        CoinInfo(
            id: "wbtc",
            score: 2,
            name: "Wrapped Bitcoin",
            symbol: "WBTC",
            image: "https://cryptologos.cc/logos/wrapped-bitcoin-wbtc-logo.png",
            price: 67886314,
            volatility: -2.73,
            isFavorite: true
        )
    ]
    
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

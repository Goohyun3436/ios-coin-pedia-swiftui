//
//  StorageView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct StorageView: View {
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
            id: "btc2",
            score: 1,
            name: "Bitcoin",
            symbol: "BTC",
            image: "https://cryptologos.cc/logos/bitcoin-btc-logo.png",
            price: 69234245,
            volatility: -0.64,
            isFavorite: true
        ),
        CoinInfo(
            id: "wbtc2",
            score: 2,
            name: "Wrapped Bitcoin",
            symbol: "WBTC",
            image: "https://cryptologos.cc/logos/wrapped-bitcoin-wbtc-logo.png",
            price: 67886314,
            volatility: -2.73,
            isFavorite: true
        ),
        CoinInfo(
            id: "btc3",
            score: 1,
            name: "Bitcoin",
            symbol: "BTC",
            image: "https://cryptologos.cc/logos/bitcoin-btc-logo.png",
            price: 69234245,
            volatility: -0.64,
            isFavorite: true
        ),
        CoinInfo(
            id: "wbtc3",
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
                .navigationTitle("Favorite Coin")
        }
    }
    
    private func mainView() -> some View {
        VerticalScrollView {
            HorizontalGridView(items: coins, itemInRow: 2) { coin in
                CoinCardView(coin: coin)
                    .frame(width: UIScreen.main.bounds.width * 0.5 - 32)
            }
        }
    }
}

#Preview {
    StorageView()
}

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
    @State var dummyCoinDetail = CoinDetailInfo(
        id: "solana",
        name: "Solana",
        symbol: "SOL",
        image: "https://assets.coingecko.com/coins/images/4128/large/solana.png",
        price: 69234245,
        volatility: 3.22,
        lastUpdated: "2025-04-21T12:34:56Z",
        high24H: "₩69,234,243",
        low24H: "₩69,234,245",
        ath: "₩2,869,234,243",
        atl: "₩6,364",
        chartInfo: CoinChartInfo(
            data: (0..<30).map { i in
                CoinChartData(
                    time: Calendar.current.date(byAdding: .hour, value: -i, to: Date())!,
                    price: Double.random(in: 68000000...70000000)
                )
            },
            yMin: 68000000 * 0.98,
            yMax: 70000000
        ),
        isFavorite: false
    )
    
    var body: some View {
        NavigationStack {
            mainView()
                .navigationTitle("Favorite Coin")
                .navigationDestination(for: CoinDetailInfo.self) { coinDetail in
                    CoinDetailView(coinDetail: $dummyCoinDetail)
                }
        }
    }
    
    private func mainView() -> some View {
        VerticalScrollView {
            HorizontalGridView(items: coins, itemInRow: 2) { coin in
                NavigationLink(value: dummyCoinDetail) {
                    CoinCardView(coin: coin)
                        .frame(width: UIScreen.main.bounds.width * 0.5 - 32)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    StorageView()
}

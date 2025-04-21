//
//  HomeView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct HomeView: View {
    let coins: [CoinInfo] = [
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
    let topCoins: [CoinInfo] = [
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
        )
    ]
    let topNFTs: [NFTInfo] = [
        NFTInfo(
            id: UUID().uuidString,
            score: 1,
            name: "Sappy Seals",
            symbol: "LTC",
            image: "sappy_seals",
            price: 1.7,
            volatility: -20.87
        ),
        NFTInfo(
            id: UUID().uuidString,
            score: 2,
            name: "Azuki",
            symbol: "LTC",
            image: "azuki",
            price: 2.3,
            volatility: 3.45
        ),
        NFTInfo(
            id: UUID().uuidString,
            score: 3,
            name: "Doodles",
            symbol: "LTC",
            image: "doodles",
            price: 1.2,
            volatility: -5.12
        ),
        NFTInfo(
            id: UUID().uuidString,
            score: 4,
            name: "CloneX",
            symbol: "LTC",
            image: "clonex",
            price: 3.0,
            volatility: 8.74
        )
    ]
    
    var body: some View {
        NavigationStack {
            mainView()
                .navigationTitle("Crypto Coin")
        }
    }
    
    private func mainView() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                sectionView("My Favorite") {
                    HorizontalScrollView {
                        ForEach(coins, id: \.id) { coin in
                            CoinCardView(coin: coin)
                                .frame(width: UIScreen.main.bounds.width * 0.6)
                        }
                    }
                }
                
                sectionView("Top15 Coin") {
                    HorizontalScrollView {
                        VerticalGridView(items: topCoins, itemInColumn: 3) { coin in
                            TopCoinRowView(coin: coin)
                                .frame(width: UIScreen.main.bounds.width * 0.8)
                        }
                    }
                }
                
                sectionView("Top7 NFT") {
                    HorizontalScrollView {
                        VerticalGridView(items: topNFTs, itemInColumn: 3) { nft in
                            TopNFTRowView(nft: nft)
                                .frame(width: UIScreen.main.bounds.width * 0.8)
                        }
                    }
                }
            }
            .padding(.top)
        }
    }
    
    private func sectionView<Content: View>(
        _ sectionTitle: String,
        content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(sectionTitle)
                .font(.title2.bold())
                .padding(.horizontal)
            
            content()
        }
    }
}

#Preview {
    HomeView()
}

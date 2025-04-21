//
//  StorageView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct StorageView: View {
    @State private var coins: [CoinInfo] = []
    @State var dummyCoinDetail: CoinDetailInfo = dummyCoinDetailInfo
    
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

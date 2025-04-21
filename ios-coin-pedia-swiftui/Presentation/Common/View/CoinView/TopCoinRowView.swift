//
//  TopCoinRowView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct TopCoinRowView: View {
    let coin: CoinInfo
    
    var body: some View {
        HStack {
            Text(coin.rank)
                .font(.body)
                .bold()
                .frame(width: 24, alignment: .trailing)
            ThumbnailView(item: coin)
            Spacer()
            VStack(alignment: .trailing) {
                Text(coin.priceFormat)
                    .font(.body)
                Text(coin.volatilityFormat)
                    .foregroundColor(coin.volatilityColor)
                    .font(.caption)
            }
        }
    }
}

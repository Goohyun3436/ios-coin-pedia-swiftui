//
//  CoinCardView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct CoinCardView: View {
    let coin: CoinInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ThumbnailView(item: coin)
            Spacer()
            Text(coin.priceFormat)
                .font(.headline.bold())
            Text(coin.volatilityFormat)
                .foregroundColor(coin.volatilityColor)
                .font(.caption)
                .bold()
        }
        .padding(16)
        .frame(maxWidth: .infinity, minHeight: 150, alignment: .leading)
        .background(.gray.opacity(0.12))
        .cornerRadius(16)
    }
}

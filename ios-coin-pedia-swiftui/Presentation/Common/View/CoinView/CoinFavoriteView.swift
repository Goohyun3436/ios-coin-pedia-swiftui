//
//  CoinFavoriteView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/21/25.
//

import SwiftUI

struct CoinFavoriteView: View {
    let coin: CoinInfo
    
    var body: some View {
        HStack {
            ThumbnailView(item: coin)
            Spacer()
            Image(systemName: coin.isFavorite ? "star.fill" : "star")
        }
    }
}

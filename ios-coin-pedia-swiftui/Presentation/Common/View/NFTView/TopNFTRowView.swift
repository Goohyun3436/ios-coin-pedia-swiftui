//
//  TopNFTRowView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct TopNFTRowView: View {
    let nft: NFTInfo
    
    var body: some View {
        HStack {
            Text(nft.scoreFormat)
                .font(.body)
                .bold()
                .frame(width: 24, alignment: .trailing)
            ThumbnailView(item: nft)
            Spacer()
            VStack(alignment: .trailing) {
                Text(nft.priceFormat)
                    .font(.body)
                Text(nft.volatilityFormat)
                    .foregroundColor(nft.volatilityColor)
                    .font(.caption)
            }
        }
    }
}

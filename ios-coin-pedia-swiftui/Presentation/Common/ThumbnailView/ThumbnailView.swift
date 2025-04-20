//
//  CoinThumbnailView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct ThumbnailView<Item: ThumbnailViewProtocol>: View {
    let item: Item
    
    var body: some View {
        HStack(spacing: 8) {
            CoinImageView(url: item.image)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(item.name)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(item.symbol)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
    }
}

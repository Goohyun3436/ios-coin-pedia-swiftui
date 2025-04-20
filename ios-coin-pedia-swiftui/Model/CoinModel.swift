//
//  CoinModel.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

//MARK: - Thumbnail
protocol ThumbnailViewProtocol {
    var id: String { get }
    var name: String { get }
    var symbol: String { get }
    var image: String { get }
}

//MARK: - Coin
struct CoinInfo: Identifiable, ThumbnailViewProtocol {
    let id: String
    let score: Int?
    let name: String
    let symbol: String
    let image: String
    let price: Double
    let volatility: Double
    let isFavorite: Bool
    
    var scoreFormat: String {
        "\(score ?? 0)"
    }
    var priceFormat: String {
        "₩\(Int(price).formatted())"
    }
    var volatilityFormat: String {
        "+0.64%"
    }
    var volatilityColor: Color {
        if volatility > 0 {
            Color.blue
        } else if volatility == 0 {
            Color.black
        } else {
            Color.red
        }
    }
}

struct CoinPriceInfo {
    let title: String
    let price: Double
    var priceKRW: String {
        "₩\(Int(price).formatted())"
    }
}

//MARK: - NFT
struct NFTInfo: Identifiable, ThumbnailViewProtocol {
    let id: String
    let score: Int?
    let name: String
    var symbol: String
    let image: String
    let price: Double
    let volatility: Double
    
    var scoreFormat: String {
        "\(score ?? 0)"
    }
    var priceFormat: String {
        "\(Int(price).formatted()) ETH"
    }
    var volatilityFormat: String {
        "+0.64%"
    }
    var volatilityColor: Color {
        if volatility > 0 {
            Color.blue
        } else if volatility == 0 {
            Color.black
        } else {
            Color.red
        }
    }
}

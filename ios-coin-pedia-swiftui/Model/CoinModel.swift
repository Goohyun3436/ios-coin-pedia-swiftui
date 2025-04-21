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

//MARK: - Coin Detail
struct CoinDetailInfo: Identifiable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let image: String
    let price: Double
    let volatility: Double
    let lastUpdated: String
    let high24H: String
    let low24H: String
    let ath: String
    let atl: String
    let chartInfo: CoinChartInfo
    var isFavorite: Bool
    
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

struct CoinChartInfo: Hashable {
    let data: [CoinChartData]
    var yMin: Double = 0
    var yMax: Double = 0
}

struct CoinChartData: Identifiable, Hashable {
    let id = UUID()
    let time: Date
    let price: Double
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

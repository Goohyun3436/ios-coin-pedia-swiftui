//
//  CoingeckoResponse.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/21/25.
//

import Foundation

//MARK: - Trending

//MARK: - Coin
typealias CGTrendingInfo = (coins: [CoinInfo], nfts: [NFTInfo])

struct CGTrendingDTO: Decodable {
    var coins: [CGCoinsDTO]
    var nfts: [CGNFTDTO]
    
    func transform() -> CGTrendingInfo {
        return (
            coins: coins.map { $0.item.transform() },
            nfts: nfts.enumerated().map { $1.transform(score: $0) }
        )
    }
}

struct CGCoinsDTO: Decodable {
    let item: CGTrendingCoinDTO
}

struct CGTrendingCoinDTO: Decodable {
    let id: String
    let coinId: Int
    let name: String
    let symbol: String
    let thumb: String
    let score: Int
    let data: CGCoinDataInfo
    
    func transform() -> CoinInfo {
        CoinInfo(
            id: id,
            rank: "\(score + 1)",
            name: name,
            symbol: symbol,
            image: thumb,
            price: data.price,
            volatility: data.priceChangePercentage24H.krw,
            isFavorite: false //UserStaticStorage.favoriteIds.contains(id)
        )
    }
}

struct CGCoinDataInfo: Decodable {
    let price: Double
    let priceChangePercentage24H: CGCoinPriceChangePercentage24H
}

struct CGCoinPriceChangePercentage24H: Decodable {
    let krw: Double
}

//MARK: - NFT
struct CGNFTDTO: Decodable {
    let id: String
    let name: String
    let symbol: String
    let thumb: String
    let floorPrice24HPercentageChange: Double
    let data: CGNFTDataInfo
    
    func transform(score: Int) -> NFTInfo {
        NFTInfo(
            id: id,
            rank: "\(score + 1)",
            name: name,
            symbol: symbol,
            image: thumb,
            price: data.h24AverageSalePrice,
            volatility: data.floorPrice24HPercentageChange ?? 0.0
        )
    }
}

struct CGNFTDataInfo: Decodable {
    let h24AverageSalePrice: String
    let floorPrice24HPercentageChange: Double?
}

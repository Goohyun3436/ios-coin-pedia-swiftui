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

//MARK: - Search
struct CGSearchDTO: Decodable {
    let coins: [CGSearchInfoDTO]
    
    func transform() -> [CoinInfo] {
        coins.map { $0.transform() }
    }
}

struct CGSearchInfoDTO: Decodable {
    let id: String
    let name: String
    let symbol: String
    let marketCapRank: Int
    let thumb: String
    
    func transform() -> CoinInfo {
        CoinInfo(
            id: id,
            rank: "#\(marketCapRank)",
            name: name,
            symbol: symbol,
            image: thumb,
            isFavorite: false //UserStaticStorage.favoriteIds.contains(id)
        )
    }
}

//MARK: - Dummy
var dummyCoinDetailInfo = CoinDetailInfo(
    id: "solana",
    name: "Solana",
    symbol: "SOL",
    image: "https://assets.coingecko.com/coins/images/4128/large/solana.png",
    price: 69234245,
    volatility: 3.22,
    lastUpdated: "2025-04-21T12:34:56Z",
    high24H: "₩69,234,243",
    low24H: "₩69,234,245",
    ath: "₩2,869,234,243",
    atl: "₩6,364",
    chartInfo: CoinChartInfo(
        data: (0..<30).map { i in
            CoinChartData(
                time: Calendar.current.date(byAdding: .hour, value: -i, to: Date())!,
                price: Double.random(in: 68000000...70000000)
            )
        },
        yMin: 68000000 * 0.98,
        yMax: 70000000
    ),
    isFavorite: false
)

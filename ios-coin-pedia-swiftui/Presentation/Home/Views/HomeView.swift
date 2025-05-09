//
//  HomeView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct HomeView: View {
    @State private var myCoins: [CoinInfo] = []
    @State private var topCoins: [CoinInfo] = []
    @State private var topNFTs: [NFTInfo] = []
    @State private var isAlert: Bool = false
    @State private var error: APIError? = nil
    
    @State private var dummyCoinDetail: CoinDetailInfo = dummyCoinDetailInfo
    
    var body: some View {
        NavigationStack {
            mainView()
                .navigationTitle("Crypto Coin")
                .navigationDestination(for: CoinDetailInfo.self) { coinDetail in
                    CoinDetailView(coinDetail: $dummyCoinDetail)
                }
        }
        .task {
            await callRequest()
        }
    }
    
    private func mainView() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                sectionView("My Favorite") {
                    HorizontalScrollView {
                        ForEach(myCoins, id: \.id) { coin in
                            NavigationLink(value: dummyCoinDetailInfo) {
                                CoinCardView(coin: coin)
                                    .frame(width: UIScreen.main.bounds.width * 0.6)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                sectionView("Top15 Coin") {
                    HorizontalScrollView {
                        VerticalGridView(items: topCoins, itemInColumn: 3) { coin in
                            NavigationLink(value: dummyCoinDetailInfo) {
                                TopCoinRowView(coin: coin)
                                    .frame(width: UIScreen.main.bounds.width * 0.8)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                sectionView("Top7 NFT") {
                    HorizontalScrollView {
                        VerticalGridView(items: topNFTs, itemInColumn: 3) { nft in
                            NavigationLink(value: dummyCoinDetailInfo) {
                                TopNFTRowView(nft: nft)
                                    .frame(width: UIScreen.main.bounds.width * 0.8)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .padding(.top)
        }
        .configureAlert(
            isShow: $isAlert,
            title: error?.title,
            message: error?.message,
            primaryButton: .default(Text("확인"))
        )
    }
    
    private func sectionView<Content: View>(
        _ sectionTitle: String,
        content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(sectionTitle)
                .font(.title2.bold())
                .padding(.horizontal)
            
            content()
        }
    }
    
    private func callRequest() async {
        let result = await NetworkManager.shared.fetchCGTrending()
        
        switch result {
        case .success(let data):
            let object = data.transform()
            myCoins = object.coins  //refactor: realm 데이터로 교체
            topCoins = object.coins
            topNFTs = object.nfts
        case .failure(let err):
            isAlert = true
            error = err
        }
    }
}

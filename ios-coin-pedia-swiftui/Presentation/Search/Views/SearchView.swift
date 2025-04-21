//
//  SearchView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct SearchView: View {
    @State private var query: String = ""
    @State private var coins: [CoinInfo] = []
    @State private var isAlert: Bool = false
    @State private var error: APIError? = nil
    @State private var isValidationAlert: Bool = false
    @State private var validationError: SearchError? = nil
    
    @State private var dummyCoinDetail: CoinDetailInfo = dummyCoinDetailInfo
    
    var body: some View {
        NavigationStack {
            mainView()
                .navigationTitle("Search")
                .navigationDestination(for: CoinDetailInfo.self) { coinDetail in
                    CoinDetailView(coinDetail: $dummyCoinDetail)
                }
        }
    }
    
    private func mainView() -> some View {
        VerticalScrollView {
            ForEach(coins, id: \.id) { coin in
                NavigationLink(value: dummyCoinDetailInfo) {
                    CoinFavoriteView(coin: coin)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.vertical, 16)
        .asNavigationSearchable(
            text: $query,
            placeholder: "코인 검색",
            onSubmit: { query in
                Task {
                    await callRequest()
                }
            },
            onChange: { query in
//                print(query)
            },
            initial: false
        )
        .configureAlert(
            isShow: $isValidationAlert,
            title: validationError?.title,
            message: validationError?.message,
            primaryButton: .default(Text("확인"))
        )
        .configureAlert(
            isShow: $isAlert,
            title: error?.title,
            message: error?.message,
            primaryButton: .default(Text("확인"))
        )
    }
    
    private func callRequest() async {
        let validation = SearchError.validation(query)
        
        switch validation {
        case .success(let query):
            let result = await NetworkManager.shared.fetchCGSearch(query)
            
            switch result {
            case .success(let data):
                coins = data.transform()
            case .failure(let err):
                isAlert = true
                error = err
            }
        case .failure(let valErr):
            isAlert = true
            validationError = valErr
        }
    }
}

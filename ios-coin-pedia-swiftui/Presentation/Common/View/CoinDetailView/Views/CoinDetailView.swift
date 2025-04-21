//
//  CoinDetailView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/21/25.
//

import SwiftUI

struct CoinDetailView: View {
    @Binding var coinDetail: CoinDetailInfo
    
    var body: some View {
        mainView()
    }
    
    private func mainView() -> some View {
        VerticalScrollView {
            VStack(alignment: .center, spacing: 8) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "diamond.fill")
                            .foregroundColor(.blue)
                        Text(coinDetail.name)
                            .font(.title2)
                            .bold()
                    }
                    
                    Text(coinDetail.priceFormat)
                        .font(.largeTitle)
                        .bold()
                    
                    HStack {
                        Text(coinDetail.volatilityFormat)
                            .font(.subheadline)
                            .foregroundColor(.red)
                        Text("Today")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Grid(verticalSpacing: 8) {
                    GridRow {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("고가")
                                .font(.subheadline)
                                .foregroundColor(.red)
                            Text(coinDetail.high24H)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("저가")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            Text(coinDetail.low24H)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    GridRow {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("신고점")
                                .font(.subheadline)
                                .foregroundColor(.red)
                            Text(coinDetail.ath)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("신저점")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            Text(coinDetail.atl)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 16)
                
                VStack(alignment: .trailing) {
                    CoinChartView(info: coinDetail.chartInfo)
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                    
                    Text(coinDetail.lastUpdated)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    coinDetail.isFavorite.toggle()
                }) {
                    Image(systemName: coinDetail.isFavorite ? "star.fill" : "star")
                        .foregroundColor(coinDetail.isFavorite ? .yellow : .gray)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

extension Double {
    func formattedWithSeparator() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

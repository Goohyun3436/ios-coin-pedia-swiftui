//
//  CoinImageView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct CoinImageView: View {
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { data in
            switch data {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
            case .failure(_):
                imagePlaceholder()
            @unknown default:
                imagePlaceholder()
            }
        }
        .frame(width: 34, height: 34)
        .background(Color.white)
        .clipShape(Circle())
    }
    
    private func imagePlaceholder() -> some View {
        Image(systemName: "bitcoinsign.circle.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(.gray.opacity(0.4))
    }
}

//
//  VerticalScrollView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/21/25.
//

import SwiftUI

struct VerticalScrollView<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 16) {
                content()
            }
            .padding(.horizontal)
        }
    }
}

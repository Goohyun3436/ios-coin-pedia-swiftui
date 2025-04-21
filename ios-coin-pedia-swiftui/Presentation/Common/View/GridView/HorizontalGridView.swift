//
//  HorizontalGridView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct HorizontalGridView<Item: Identifiable, Content: View>: View {
    private let columns: [GridItem]
    let items: [Item]
    let content: (Item) -> Content
    
    init(items: [Item], itemInRow: Int, content: @escaping (Item) -> Content) {
        columns = Array(repeating: .init(.flexible()), count: itemInRow)
        self.items = items
        self.content = content
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(items) { item in
                content(item)
            }
        }
        .padding(.vertical, 16)
    }
}

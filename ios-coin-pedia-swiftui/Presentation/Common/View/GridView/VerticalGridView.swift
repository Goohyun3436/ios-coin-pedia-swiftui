//
//  VerticalGridView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import SwiftUI

struct VerticalGridView<Item: Identifiable, Content: View>: View {
    private let rows: [GridItem]
    let items: [Item]
    let content: (Item) -> Content
    
    init(items: [Item], itemInColumn: Int, content: @escaping (Item) -> Content) {
        rows = Array(repeating: .init(.flexible()), count: itemInColumn)
        self.items = items
        self.content = content
    }
    
    var body: some View {
        LazyHGrid(rows: rows, spacing: 24) {
            ForEach(items) { item in
                content(item)
                    .padding(.vertical, 8)
            }
        }
        .padding(.vertical, 16)
    }
}

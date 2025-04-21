//
//  CoinChartView.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/21/25.
//

import SwiftUI
import Charts

struct CoinChartView: View {
    let info: CoinChartInfo
    
    var body: some View {
        Chart(info.data) {
            LineMark(
                x: .value("Time", $0.time, unit: .hour),
                y: .value("Price", $0.price)
            )
            .foregroundStyle(.blue)
            .lineStyle(StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .interpolationMethod(.monotone)
            
            AreaMark(
                x: .value("Time", $0.time, unit: .hour),
                yStart: .value("Min", info.yMin),
                yEnd: .value("Value", $0.price)
            )
            .foregroundStyle(LinearGradient(
                colors: [Color.blue.opacity(0.8), Color.blue.opacity(0.1)],
                startPoint: .top,
                endPoint: .bottom
            ))
            .interpolationMethod(.catmullRom)
        }
        .chartXAxis { AxisMarks() { _ in } }
        .chartYAxis { AxisMarks() { _ in } }
        .chartYScale(domain: info.yMin...info.yMax)
    }
}

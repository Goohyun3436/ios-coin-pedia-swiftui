//
//  PriceManager.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/21/25.
//

import Foundation

final class PriceManager {
    enum NumberType {
        case int
        case double1f
        case double2f
        case zero
        
        init(_ num: Double) {
            if num == 0 {
                self = .zero
                return
            }
            
            if num == Double(Int(num)) {
                self = .int
                return
            }
            
            if let last = String(format: "%.2f", num).last, last == "0" {
                self = .double1f
            } else {
                self = .double2f
            }
        }
    }
    
    static let shared = PriceManager()
    
    private init() {}
    
    func price(_ price: Double) -> String {
        var result = ""
        
        switch NumberType(price) {
        case .int:
            result = price.formatted()
        case .double1f, .double2f:
            result = String(format: "%.2f", price)
        case .zero:
            result = "0"
        }
        
        return "₩\(result)"
    }
    
    func volatility(_ percentage: Double) -> String {
        String(format: "%.2f", fabs(percentage)) + "%"
    }
}

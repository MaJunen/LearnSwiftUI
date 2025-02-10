//
//  NumberFormatter+Ext.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/6.
//

import Foundation

extension NumberFormatter {
    static func currency(from value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let formattedValue = formatter.string(from: NSNumber(value: value)) ?? ""
        
        return "$" + formattedValue
    }
}

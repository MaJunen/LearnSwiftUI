//
//  Date+Ext.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/6.
//

import Foundation

extension Date {
    static var today: Date {
        Date()
    }
    
    static var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    }
    
    static var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    }
    
    var month: Int {
        Calendar.current.component(.month, from: self)
    }
    
    static func fromString(string: String, with format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: string)
    }
    
    func string(with format: String = "dd MM yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

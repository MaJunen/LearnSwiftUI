//
//  PaymentDetailViewModel.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/7.
//
import Foundation

struct PaymentDetailViewModel {
    var payment: PaymentActivity
    
    var name: String {
        payment.name
    }
    
    var date: String {
        payment.date.string()
    }
    
    var address: String {
        payment.address ?? ""
    }
    
    var typeIcon: String {
        let icon: String
        switch payment.type {
        case .income: icon = "arrowtriangle.up.circle.fill"
        case .expense: icon = "arrowtriangle.down.circle.fill"
        }
        return icon
    }
    
    var image: String = "payment-detail"
    
    var amount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        
        let formattedValue = formatter.string(from: NSNumber(value: payment.amount)) ?? ""
        
        let formattedAmount = ((payment.type == .income) ? "+" : "-") + "$" + formattedValue
        
        return formattedAmount
    }
    
    var memo: String {
        return payment.memo ?? ""
    }
    
    init(payment: PaymentActivity) {
        self.payment = payment
    }
}

//
//  TransactionCard.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/27.
//
import Foundation

struct TransactionCard: Identifiable {
    var id = UUID()
    var merchant: String
    var amount: Double
    var date: String
    var icon: String = "dollarsign.circle.fill"
}

let testTransactions = [
    TransactionCard(merchant: "Mushroom", amount: 120.0, date: "11/2/2020", icon: "star.circle.fill"),
    TransactionCard(merchant: "Amazon", amount: 50.0, date: "10/2/2020", icon: "cart.fill"),
    TransactionCard(merchant: "MUJI", amount: 300.0, date: "8/2/2020", icon: "app.gift.fill"),
    TransactionCard(merchant: "Apple", amount: 800.0, date: "4/2/2020", icon: "headphones"),
    TransactionCard(merchant: "Netflix", amount: 19.0, date: "11/2/2020", icon: "tv"),
    TransactionCard(merchant: "ANA", amount: 480.0, date: "11/2/2020", icon: "airplane")
]

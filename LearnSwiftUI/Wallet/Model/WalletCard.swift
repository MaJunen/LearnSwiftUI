//
//  WalletCard.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/27.
//

import Foundation

enum WalletCardDragState {
    case inactive
    case pressing(index: Int? = nil)
    case dragging(index: Int? = nil, translation: CGSize)
    
    var index: Int? {
        switch self {
        case .pressing(let index), .dragging(let index, _):
            return index
        case .inactive:
            return nil
        }
    }
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(_ ,let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}

enum WalletCardType: String {
    case visa
    case master
    case ae
    case chase
    case discover
}

struct WalletCard: Identifiable {
    var id = UUID()
    var name: String
    var type: WalletCardType
    var number: String
    var expiryDate: String
    var image: String {
        return type.rawValue
    }
}

let testCards = [
    WalletCard(name: "James Hayward", type: .visa, number: "4242 4242 4242 4242", expiryDate: "3/23"),
    WalletCard(name: "Cassie Emily", type: .master, number: "5353 5353 5353 5353", expiryDate: "10/21"),
    WalletCard(name: "Adam Green", type: .ae, number: "3737 3737 3737 3737", expiryDate: "8/22"),
    WalletCard(name: "Donald Wayne", type: .chase, number: "6363 6263 6362 6111", expiryDate: "11/23"),
    WalletCard(name: "Gloria Jane", type: .discover, number: "6011 0009 9013 9424", expiryDate: "5/24")
]

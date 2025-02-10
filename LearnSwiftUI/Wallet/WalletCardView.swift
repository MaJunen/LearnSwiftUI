//
//  WalletCardView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/27.
//

import SwiftUI

struct WalletCardView: View {
    var card: WalletCard
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottomLeading, content: {
                VStack(alignment: .leading) {
                    Text(card.number)
                        .bold()
                    HStack {
                        Text(card.name)
                            .bold()
                        Text("Valid Thru")
                            .font(.footnote)
                        Text(card.expiryDate)
                            .font(.footnote)
                    }
                }
                .foregroundStyle(.white)
                .padding(.leading, 25)
                .padding(.bottom, 20)
            })
            .shadow(color: .gray, radius: 1.0, x: 0.0, y: 1.0)
    }
}

#Preview {
    WalletCardView(card: testCards[0])
}

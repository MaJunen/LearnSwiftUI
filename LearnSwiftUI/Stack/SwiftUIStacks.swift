//
//  SwiftUIStacks.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/26.
//

import SwiftUI

struct SwiftUIStacks: View {
    var body: some View {
        VStack {
            HeaderView()
            HStack(spacing: 15) {
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                ZStack {
                    PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    Text("Best for designer")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(5)
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 87)
                }
            }
            ZStack {
                PricingView(title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255), icon: "wand.and.rays")
                Text("Perfectt for teams with 20 members")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .offset(x: 0, y: 110)
            }
            Spacer()
        }
    }
}

#Preview {
    SwiftUIStacks()
}

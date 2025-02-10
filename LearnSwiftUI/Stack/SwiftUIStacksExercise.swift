//
//  SwiftUIStacksExercise.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/26.
//

import SwiftUI

struct SwiftUIStacksExercise: View {
    var body: some View {
        ZStack {
            PricingView(title: "Basic", price: "$299", textColor: .white, bgColor: .purple, icon: "star")
                .offset(x: 0, y: 180)
                .scaleEffect(0.95)
            PricingView(title: "Pro", price: "$19", textColor: .white, bgColor: .blue, icon: "globe.central.south.asia")
                .scaleEffect(0.9)
            PricingView(title: "Team", price: "$9", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255), icon: "wand.and.rays")
                .offset(x: 0, y: -210)
                .scaleEffect(0.85)
        }
    }
}

#Preview {
    SwiftUIStacksExercise()
}

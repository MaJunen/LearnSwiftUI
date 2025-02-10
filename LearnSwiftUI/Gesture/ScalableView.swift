//
//  ScalableView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/21.
//

import SwiftUI

struct ScalableView: View {
    
    @GestureState private var scaleGesture: CGFloat = 1.0
    
    var body: some View {
        Image(systemName: "headphones")
            .font(.system(size: 200))
            .foregroundColor(.purple)
            .scaleEffect(scaleGesture)
            .animation(.default, value: scaleGesture)
            .gesture(
                MagnificationGesture()
                    .updating($scaleGesture, body: { value, state, transaction in
                        state = value
                    })
            )
    }
}

#Preview {
    ScalableView()
}

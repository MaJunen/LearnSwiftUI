//
//  CounterButton.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/30.
//

import SwiftUI

struct CounterButton: View {
    
    @Binding var counter: Int
    var color: Color
    var size: CGFloat
    
    var body: some View {
        Button {
            counter += 1
        } label: {
            Circle()
                .frame(width: size * 2, height: size * 2)
                .foregroundStyle(color)
                .overlay {
                    Text("\(counter)")
                        .font(.system(size: size, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
            
        }
    }
}

#Preview {
    CounterButton(counter: Binding(get: {
        100
    }, set: {
        print("\($0)")
    }), color: .green, size: 100)
}

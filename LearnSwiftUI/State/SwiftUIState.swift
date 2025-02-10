//
//  SwiftUIState.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/30.
//

import SwiftUI

struct SwiftUIState: View {
    
    @State private var isPlaying = false
    @State private var number = 688
    
    var body: some View {
        Button {
            self.isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                .font(.system(size: 150))
                .foregroundStyle(.green)
        }
        
        Button {
            number += 1
        } label: {
            Text("\(number)")
                .font(.system(size: 60))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding()
        }
        .tint(.red)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.circle)
        .controlSize(.large)
        
        CounterButton(counter: $number, color: .blue, size: 60)
    }
}

#Preview {
    SwiftUIState()
}

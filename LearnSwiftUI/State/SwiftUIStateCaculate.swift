//
//  SwiftUIStateCaculate.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/30.
//

import SwiftUI

struct SwiftUIStateCaculate: View {
    @State private var counter = 7
    
    var body: some View {
        CaculateText(totalCounter: $counter)
        
        HStack {
            CounterButton(counter: $counter, color: .blue, size: 60)
            CounterButton(counter: Binding(get: { 21 }, set: { _ in }), color: .green, size: 60)
            CounterButton(counter: Binding(get: { 73 }, set: { _ in }), color: .red, size: 60)
        }
    }
}

struct CaculateText: View {
    @Binding var totalCounter: Int
    
    var body: some View {
        Text("\(totalCounter + 21 + 73)")
            .font(.system(size: 200, weight: .bold, design: .rounded))
    }
}

#Preview {
    SwiftUIStateCaculate()
}

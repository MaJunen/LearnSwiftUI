//
//  ButtonAnimation.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/10.
//

import SwiftUI

struct ButtonAnimation: View {
    
    @State private var processing = false
    @State private var loading = false
    @State private var completed = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: processing ? 250 : 200, height: 60)
                .foregroundStyle(completed ? .red : .green)
            
            if !processing {
                Text("Submit")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .transition(.move(edge: .top))
            }
            
            if processing && !completed {
                HStack {
                    Circle()
                        .trim(from: 0, to: 0.9)
                        .stroke(Color.white, lineWidth: 3)
                        .frame(width: 30, height: 30)
                        .rotationEffect(Angle(degrees: loading ? 360 : 0))
                        .animation(.easeOut.repeatForever(autoreverses: false), value: loading)
                    Text("Processing")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                }
                .transition(.opacity)
                .onAppear() {
                    self.startProcessing()
                }
            }
            
            if completed {
                Text("Done")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .onAppear() {
                        self.endProessing()
                    }
            }
        }
        .animation(.spring(), value: loading)
        .onTapGesture {
            if !loading {
                self.processing.toggle()
            }
        }
    }
    
    private func startProcessing() {
        self.loading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.completed = true
        }
    }
    
    private func endProessing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.processing = false
            self.completed = false
            self.loading = false
        }
    }
}

#Preview {
    ButtonAnimation()
}

//
//  SwiftUIProgressExerciseView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/10.
//

import SwiftUI

struct SwiftUIProgressExerciseView: View {
    @State var progress = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                SwiftUIProgressRingView(progress: $progress, thickness: 30, width: 300, gradient: Gradient(colors: [.darkPurple, .lightPurple]))
                SwiftUIProgressRingView(progress: $progress, thickness: 30, width: 235, gradient: Gradient(colors: [.darkYellow, .lightYellow]))
                SwiftUIProgressRingView(progress: $progress, thickness: 30, width: 170, gradient: Gradient(colors: [.darkGreen, .lightGreen]))
            }
            .animation(.easeInOut(duration: 1.0), value: progress)
            
            HStack {
                Group {
                    Text("25%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.25
                        }
                    
                    Text("50%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.5
                        }
                    
                    Text("75%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.75
                        }
                    
                    Text("100%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 1.0
                        }
                }
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
            }
            .padding(.top, 50)
        }
    }
}

#Preview {
    SwiftUIProgressExerciseView()
}

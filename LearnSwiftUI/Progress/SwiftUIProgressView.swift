//
//  SwiftUIProgressView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/10.
//

import SwiftUI

struct SwiftUIProgressView: View {
    
    @State var progress = 0.0
    
    var body: some View {
        VStack {
            SwiftUIProgressRingView(progress: $progress)
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            HStack {
                Group {
                    Text("0%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.0
                        }
                    
                    Text("50%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.5
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
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    SwiftUIProgressView()
}

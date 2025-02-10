//
//  SwiftUITransition.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/10.
//

import SwiftUI

struct SwiftUITransition: View {
    
    @State private var show = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundStyle(.green)
                .overlay {
                    Text("Show details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                }
                .onTapGesture {
                    withAnimation(Animation.spring()) {
                        self.show.toggle()
                    }
                }
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.purple)
                    .overlay {
                        Text("Well, here is the details")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundStyle(.white)
                    }
                    // AnyTransition:scale转场，anchor作为锚点
                    // 内建转场参数：.opaque、.offset、.move 與 .slide
//                    .transition(.scale(scale: 0, anchor: .bottom))
//                    .transition(.offset(x: -600, y: 0))
//                    .transition(.opacity)
//                    .transition(.move(edge: .bottom))
//                    .transition(.slide)
                    // 混合两个转场
//                    .transition(AnyTransition.offset(x: -600, y: 0).combined(with: .scale))
                    // 混合3个转场
//                    .transition(AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity))
//                    .transition(AnyTransition.offsetScaleOpacity)
                    .transition(AnyTransition.scaleAndOffset)
            }
        }
    }
}

// 复用，自定义，扩展动画
extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
    
    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .scale(scale: 0, anchor: .bottom),
            removal: .offset(x: -600, y: 0)
        )
    }
}

#Preview {
    SwiftUITransition()
}

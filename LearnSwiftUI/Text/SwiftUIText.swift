//
//  SwiftUIText.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/26.
//

import SwiftUI

struct SwiftUIText: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
                .fontWeight(.bold)
//                .font(.largeTitle)
                // 使用自定义字体
                .font(.custom("Nunito", size: 30))
                // 字体圆润
                .fontDesign(.rounded)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                // 截断模式
                .truncationMode(.head)
                // 行距
                .lineSpacing(10)
                .padding()
                // 旋转, 旋转角度，anchor：旋转点
//                .rotationEffect(.degrees(45), anchor: UnitPoint(x: 0, y: 0))
                // 透视文字特效,旋转角度, axis:旋转轴
                .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                // 透视文字阴影
                .shadow(color: .gray, radius: 2, x: 0, y: 15)
            // SwiftUI 內置了對 Markdown 的支持
            Text("**This is how you bold a text**. *This is how you make text italic.* You can [click this link](https://www.appcoda.com) to go to appcoda.com")
        }
        .padding()
    }
}

#Preview {
    SwiftUIText()
}

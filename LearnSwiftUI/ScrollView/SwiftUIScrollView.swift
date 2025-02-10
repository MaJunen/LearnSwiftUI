//
//  SwiftUIScrollView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/27.
//

import SwiftUI

struct SwiftUIScrollView: View {
    var body: some View {
        VStack {
            ScrollHeaderView()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Group {
                        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Written by Simon Ng")
                        CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                        CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                        CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
                    }
                    .frame(width: 300)
                    // 文字展示不完全的时候，最小缩放量
                    .minimumScaleFactor(0.5)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    SwiftUIScrollView()
}

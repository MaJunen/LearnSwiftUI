//
//  SwiftUIGridLayoutView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/8.
//

import SwiftUI

struct SwiftUIGridLayoutView: View {
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var colors: [Color] = [.yellow, .purple, .green]
    
    // GridItem中的spacing更新列间距
//    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 6)
    
    // 最小尺寸为50
//    private var gridItemLayout = [GridItem(.adaptive(minimum: 50))]
    
    // 固定宽度的列
//    private var gridItemLayout = [GridItem(.fixed(100)), GridItem(.fixed(150))]
    
    // 混合使用
    private var gridItemLayout = [GridItem(.fixed(100)), GridItem(.adaptive(minimum: 50))]
    
    var body: some View {
//        lazyVGrid()
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItemLayout, spacing: 20) {
                ForEach(0...9999, id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
                        .font(.system(size: 30))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
                }
            }
        }
    }
    
    private func lazyVGrid() -> some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(0...9999, id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
                        .font(.system(size: 30))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    SwiftUIGridLayoutView()
}

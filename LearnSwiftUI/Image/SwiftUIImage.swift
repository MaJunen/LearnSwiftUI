//
//  SwiftUIImage.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/26.
//

import SwiftUI

struct SwiftUIImage: View {
    var body: some View {
//        image1()
//        image2()
        Image(systemName: "slowmo", variableValue: 0.8)
            // 更改多种颜色的模式
            .symbolRenderingMode(.palette)
            .foregroundStyle(.indigo, .yellow, .gray)
            .font(.system(size: 200))
    }
    
    func image2() -> some View {
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(
//                Rectangle()
//                    .foregroundStyle(.black)
//                    .opacity(0.4)
                Color.black
                    .opacity(0.4)
                    .overlay(
                        Text("Paris")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundStyle(.white)
                            .frame(width: 200)
                    )
            )
    }
    
    func image1() -> some View {
        // 图片填满整个屏幕（安全区域内）
        Image("paris")
            .resizable()
            // 忽略安全区域
            .ignoresSafeArea()
//                .scaledToFit()
            // 设置contentMode，与上面效果一致
            .aspectRatio(contentMode: .fill)
            .frame(width: 300)
            // 裁剪,单裁剪clipToBounds效果
//                .clipped()
            // 裁剪成不同形状
            .clipShape(.circle)
            .opacity(0.5)
            // 重叠View视图
            .overlay(
                Image(systemName: "heart.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(.red)
                    .shadow(color: .gray, radius: 10, x: 0, y: 10),
                alignment: .top
            )
    }
}

#Preview {
    SwiftUIImage()
}

//
//  SwiftUIAnimation.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/10.
//

import SwiftUI

struct SwiftUIAnimation: View {
    
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    @State private var isLoading = false
    
    @State private var progress: CGFloat = 0.0
    
    @State private var recordBegin = false
    @State private var recording = false
    
    var body: some View {
//        animation1()
//        animation2()
//        zhishiqi1()
//        zhishiqi2()
//        zhishiqi3()
//        zhishiqi4()
//        zhishiqi5()
        ZStack {
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                .frame(width: recordBegin ? 60 : 250, height: 60)
                .foregroundStyle(recordBegin ? .red : .green)
                .overlay {
                    Image(systemName: "mic.fill")
                        .font(.system(.title))
                        .foregroundStyle(.white)
                        .scaleEffect(recording ? 0.7 : 1)
                }
            RoundedRectangle(cornerRadius: recording ? 35 : 10)
                .trim(from: 0, to: recordBegin ? 0.0001 : 1)
                .stroke(lineWidth: 5)
                .frame(width: recordBegin ? 70 : 260, height: 70)
                .foregroundStyle(.green)
        }
        .onTapGesture {
            withAnimation(.spring()) {
                self.recordBegin.toggle()
            }
            withAnimation(.spring().repeatForever().delay(0.5)) {
                self.recording.toggle()
            }
        }
    }
    
    // 圆点下载指示器
    private func zhishiqi5() -> some View {
        let view = HStack {
            ForEach(0...4, id: \.self) { index in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(.green)
                    .scaleEffect(self.isLoading ? 0 : 1)
                    // delay根据不同的点，进行不同的延时
                    .animation(.linear(duration: 0.6).repeatForever().delay(0.2 * Double(index)), value: isLoading)
            }
        }
        .onAppear() {
            self.isLoading = true
        }
        return view
    }
    
    // 扇形下载指示器
    private func zhishiqi4() -> some View {
        let view = ZStack {
            Text("\(Int(progress * 100))%")
                .font(.system(.title, design: .rounded))
                .bold()
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 10)
                .frame(width: 150, height: 150)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.green, lineWidth: 10)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: -90))
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                self.progress += 0.05
                print(self.progress)
                if self.progress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
        return view
    }
    
    // 水平下载指示器
    private func zhishiqi3() -> some View {
        let view = ZStack {
            Text("Loading")
                .font(.system(.body, design: .rounded))
                .bold()
                .offset(x: 0, y: -25)
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5), lineWidth: 3)
                .frame(width: 250, height: 3)
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color.green, lineWidth: 3)
                .frame(width: 30, height: 3)
                .offset(x: isLoading ? 110 : -110, y: 0)
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                .onAppear() {
                    self.isLoading = true
                }
        }
        return view
    }
    
    // 圆环指示器
    private func zhishiqi2() -> some View {
        let view = ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 100, height: 100)
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.green, lineWidth: 7)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                .onAppear() {
                    self.isLoading = true
                }
        }
        return view
    }
    
    // 圆环指示器
    private func zhishiqi1() -> some View {
        let view = Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.green, lineWidth: 5)
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            // autoreverses: 是否重复反转, duration: 持续时间
            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
            .onAppear() {
                self.isLoading = true
            }
        return view
    }
    
    private func animation2() -> some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(circleColorChanged ? Color(.systemGray5) : .red)
            Image(systemName: "heart.fill")
                .foregroundStyle(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        }
        // 显试动画
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
                self.circleColorChanged.toggle()
                self.heartColorChanged.toggle()
                self.heartSizeChanged.toggle()
            }
        }
    }
    
    private func animation1() -> some View {
        let view = ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(circleColorChanged ? Color(.systemGray5) : .red)
            Image(systemName: "heart.fill")
                .foregroundStyle(heartColorChanged ? .red : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        }
        // spring:弹簧产生心跳效果。
        // linear: 线性效果，easing: 缓动动画
        // 隐式动画
        .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3), value: circleColorChanged)
        .animation(.default, value: heartSizeChanged)
        .onTapGesture {
            circleColorChanged.toggle()
            heartColorChanged.toggle()
            heartSizeChanged.toggle()
        }
        return view
    }
}

#Preview {
    SwiftUIAnimation()
}

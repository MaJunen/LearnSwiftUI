//
//  SwiftUIProgressRingView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/10.
//

import SwiftUI

struct SwiftUIProgressRingView: View {
    // 进度
    @Binding var progress: Double
    // 粗细
    var thickness: CGFloat = 30.0
    // 半径
    var width: CGFloat = 250.0
    var gradient = Gradient(colors: [.darkPurple, .lightYellow])
    var startAngle: Double = -90.0
    var textColor = Color.primary
    
    // 圆环半径
    private var radius: Double {
        Double(width / 2)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: thickness)
            // AngularGradient(gradient: gradient, center: .center, startAngle: .degrees(startAngle), endAngle: .degrees(360 * 0.5 + startAngle))
            // 角度渐变色
            RingShape(progress: progress, thickness: thickness)
                .fill(AngularGradient(gradient: gradient, center: .center, startAngle: .degrees(startAngle), endAngle: .degrees(360 * progress + startAngle)))
                .animatableProgressText(progress: progress, textColor: textColor)
            RingTip(progress: progress, startAngle: startAngle, ringRadius: radius)
                .frame(width: thickness, height: thickness)
                .foregroundStyle(progress > 0.96 ? gradient.stops[1].color : Color.clear)
                .shadow(color: progress > 0.96 ? Color.black.opacity(0.15) : Color.clear, radius: 2, x: ringTipShadowOffset.x, y: ringTipShadowOffset.y)
        }
        .frame(width: width, height: width, alignment: .center)
    }
    
    // 计算环尖端位置
    private func ringTipPosition(progress: Double) -> CGPoint {
        let angle = 360 * progress + startAngle
        let angleInRadian = angle * .pi / 180
        return CGPoint(x: radius * cos(angleInRadian), y: radius * sin(angleInRadian))
    }
    
    // 计算环尖端的阴影偏移值
    private var ringTipShadowOffset: CGPoint {
        let shadowPostion = ringTipPosition(progress: progress + 0.01)
        let circlePosition = ringTipPosition(progress: progress)
        
        return CGPoint(x: shadowPostion.x - circlePosition.x, y: shadowPostion.y - circlePosition.y)
    }
}

#Preview {
    SwiftUIProgressRingView(progress: .constant(0.5))
}

// 将进度环视图共享到视图库
// command+shait+l
// Page:494
struct ProgressBar_Libriary: LibraryContentProvider {
    // category: 视图库中的类别
    @LibraryContentBuilder var views: [LibraryItem] {
        LibraryItem(SwiftUIProgressRingView(progress: .constant(1.0), thickness: 12.0, width: 130.0, gradient: Gradient(colors: [.darkYellow, .lightYellow])), title: "Progress Ring", category: .control)
        
        LibraryItem(SwiftUIProgressRingView(progress: .constant(1.0), thickness: 30.0, width: 250.0, gradient: Gradient(colors: [.darkYellow, .lightYellow])), title: "Progress Ring - Bingger", category: .control)
    }
    
    // 添加修饰器图库中
    @LibraryContentBuilder
    func modifiers(base: Circle) -> [LibraryItem] {
        LibraryItem(base.animatableProgressText(progress: 1.0), title: "Progress Indicator", category: .control)
    }
}

// 通过Shape协议制作圆环
struct RingShape: Shape {
    var progress: Double = 0.0
    var thickness: CGFloat = 30.0
    var startAngle: Double = -90.0
    
    // 重写animatableData属性产生动画
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.width / 2.0, y: rect.height / 2.0),
            radius: min(rect.width, rect.height) / 2.0,
            startAngle: .degrees(startAngle),
            endAngle: .degrees(360 * progress + startAngle),
            clockwise: false
        )
        
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round))
    }
}

struct RingTip: Shape {
    var progress: Double = 0.0
    var startAngle: Double = -90.0
    var ringRadius: Double
    
    private var position: CGPoint {
        let angle = 360 * progress + startAngle
        let angleInRadian = angle * .pi / 180
        return CGPoint(x: ringRadius * cos(angleInRadian), y: ringRadius * sin(angleInRadian))
    }
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    nonisolated func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard progress > 0.0 else { return path }
        
        let frame = CGRect(x: position.x, y: position.y, width: rect.size.width, height: rect.size.height)
        path.addRoundedRect(in: frame, cornerSize: frame.size)
        return path
    }
}

// 为文字创建动画
struct ProgressTextModifier: Animatable, ViewModifier {
    var progress: Double = 0.0
    var textColor: Color = .primary
    
    private var progressText: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        return formatter.string(from: NSNumber(value: progress)) ?? ""
    }
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Text(progressText)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(textColor)
                    .animation(nil)
            )
    }
}

extension View {
    func animatableProgressText(progress: Double, textColor: Color = .primary) -> some View {
        self.modifier(ProgressTextModifier(progress: progress, textColor: textColor))
    }
}

//
//  SwiftUIShape.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/10.
//

import SwiftUI

struct Dome: Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.size.width/2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        return path
    }
}

struct SwiftUIShape: View {
    
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255)]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
//        path1()
//        path2()
//        path3()
//        path4()
//        path5()
//        path6()
//        path7()
//        path8()
//        path9()
        ZStack {
            Circle()
                .trim(from: 0, to: 0.4)
                .stroke(Color(.systemBlue), lineWidth: 80)
            
            Circle()
                .trim(from: 0.4, to: 0.6)
                .stroke(Color(.systemTeal), lineWidth: 80)
            
            Circle()
                .trim(from: 0.6, to: 0.75)
                .stroke(Color(.systemPurple), lineWidth: 80)
            
            Circle()
                .trim(from: 0.75, to: 1)
                .stroke(Color(.systemYellow), lineWidth: 90)
                .overlay {
                    Text("25%")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                        .offset(x: 80, y: -100)
                }
        }
        .frame(width: 250, height: 250)
    }
    
    // 使用trim绘制圆环
    private func path9() -> some View {
        Circle()
            // trim：建立开口环，from->to：显示环的哪一部分
            .trim(from: 0, to: 0.85)
            .stroke(purpleGradient, lineWidth: 20)
            .frame(width: 300, height: 300)
            .overlay {
                VStack {
                    Text("85%")
                        .font(.system(size: 80, weight: .bold, design: .rounded))
                        .foregroundStyle(.gray)
                    Text("Complete")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundStyle(.gray)
                }
            }
    }
    
    // 使用Circle RoundedRectangle创建图形
    private func path8() -> some View {
        let view = Circle()
            .foregroundStyle(.green)
            .frame(width: 200, height: 200)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.white)
            }
        return view
    }
    
    // 使用Shape协议创建图形
    private func path7() -> some View {
        let button = Button {
            print("click test")
        } label: {
            Text("Test")
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundStyle(.white)
                .frame(width: 250, height: 50)
                .background(Dome().fill(.red))
        }
        return button
    }
    
    // 绘制矩形:addLine or addRect
    private func path6() -> some View {
        let path = HStack {
            Path() { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addQuadCurve(to: CGPoint(x: 200, y: 0), control: CGPoint(x: 100, y: -20))
                path.addLine(to: CGPoint(x: 200, y: 40))
                path.addLine(to: CGPoint(x: 0, y: 40))
                path.closeSubpath()
            }
            .fill(.green)
            
            Path() { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addQuadCurve(to: CGPoint(x: 200, y: 0), control: CGPoint(x: 100, y: -20))
                path.addRect(CGRect(x: 0, y: 0, width: 200, height: 40))
            }
            .fill(.purple)
        }
        return path
    }
    
    // 画扇形统计图
    private func path5() -> some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: CGPoint(x: 187, y: 187), radius: 150, startAngle: .degrees(0), endAngle: .degrees(190), clockwise: true)
            }
            .fill(.yellow)
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: CGPoint(x: 187, y: 187), radius: 150, startAngle: .degrees(190), endAngle: .degrees(110), clockwise: true)
            }
            .fill(.teal)
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: CGPoint(x: 187, y: 187), radius: 150, startAngle: .degrees(110), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.blue)
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: CGPoint(x: 187, y: 187), radius: 150, startAngle: .degrees(90), endAngle: .degrees(360), clockwise: true)
            }
            .fill(.purple)
            .offset(x: 20, y: 20)
            .overlay {
                Text("25%")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .offset(x: 80, y: -110)
            }
        }
    }
    
    // 画圆弧
    private func path4() -> some View {
        let path = Path { path in
            path.move(to: CGPoint(x: 200, y: 200))
            // clockwise:圆弧方向
            path.addArc(center: CGPoint(x: 200, y: 200), radius: 150, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
        }
        .fill(.green)
        return path
    }
    
    // 画出形状的边框并且以颜色填满形状ZStack
    private func path3() -> some View {
        ZStack {
            Path() { path in
                path.move(to: CGPoint(x: 20, y: 60))
                path.addLine(to: CGPoint(x: 40, y: 60))
                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                path.addLine(to: CGPoint(x: 230, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 100))
            }
            .fill(.purple)
            Path() { path in
                path.move(to: CGPoint(x: 20, y: 60))
                path.addLine(to: CGPoint(x: 40, y: 60))
                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                path.addLine(to: CGPoint(x: 230, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 100))
                path.closeSubpath()
            }
            .stroke(.black, lineWidth: 5)
        }
    }
    
    private func path2() -> some View {
        let path = Path() { path in
            path.move(to: CGPoint(x: 20, y: 60))
            path.addLine(to: CGPoint(x: 40, y: 60))
            // 画圆弧,透过一个控制点画曲线
            path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
            path.addLine(to: CGPoint(x: 230, y: 60))
            path.addLine(to: CGPoint(x: 230, y: 100))
            path.addLine(to: CGPoint(x: 20, y: 100))
        }
        .fill(.purple)
        return path
    }
    
    private func path1() -> some View {
        let path = Path() { path in
            path.move(to: CGPoint(x: 20, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
            // 封闭路径
            path.closeSubpath()
        }
//        .fill(.green)
        // 画线条
        .stroke(.green, lineWidth: 10)
        return path
    }
}

#Preview {
    SwiftUIShape()
}

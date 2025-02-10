//
//  SwiftUIButton.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/30.
//

import SwiftUI

struct SwiftUIButton: View {
    var body: some View {
        Button {
            print("Hello World tapped")
        } label: {
            Text("Hello World")
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
                .font(.title)
        }
        
        Text("Hello World")
            .foregroundStyle(.purple)
            .font(.title)
            .padding()
            .border(.purple, width: 5)
        
        Text("Hello World")
            .fontWeight(.bold)
            .font(.title)
            .padding()
            .background(.purple)
            .cornerRadius(40)
            .foregroundStyle(.white)
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(.purple, lineWidth: 5)
            }
        
        Button {
            print("delete button tapped!")
        } label: {
//            HStack {
//                Image(systemName: "trash")
//                    .font(.title)
//                Text("Delete")
//                    .fontWeight(.semibold)
//                    .font(.title)
//            }
            Label(title: {
                Text("Delete")
                    .fontWeight(.semibold)
                    .font(.title)
            }, icon: {
                Image(systemName: "trash")
                    .font(.title)
            })
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .foregroundStyle(.white)
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .shadow(color: .gray, radius: 20.0, x: 20, y: 10)
        }
        
        Button {
            print("Delete button tapped")
        } label: {
            Label {
                Text("Delete")
                    .fontWeight(.semibold)
                    .font(.title)
            } icon: {
                Image(systemName: "trash")
                    .font(.title)
            }
        }
        .buttonStyle(GradientBackgroundStyle())
        
        Button {
            print("press rotation")
        } label: {
            Image(systemName: "plus.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(.purple)
        }
        .buttonStyle(RotationStyle())
        
        Button {
            
        } label: {
            Text("Buy me a coffee")
        }
        .tint(.purple)
        .buttonStyle(.borderedProminent)
        // capsule胶囊状, roundedRectangle圆角
        .buttonBorderShape(.roundedRectangle)
        .controlSize(.large)
        
        //role:destructive红色，cancel蓝色
        Button("Delete", role: .destructive) {
            print("Delete")
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle)
        .controlSize(.large)
    }
}

struct RotationStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .rotationEffect(configuration.isPressed ? .degrees(45) : .degrees(0))
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundStyle(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

#Preview {
    SwiftUIButton()
}

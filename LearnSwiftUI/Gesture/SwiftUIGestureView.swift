//
//  SwiftUIGestureView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/21.
//

import SwiftUI

enum DraggableState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}

struct SwiftUIGestureView: View {
    
    @State private var isPressed = false
    @GestureState private var longPressTap = false
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    @GestureState private var pressed = false
    @GestureState private var dragState = DraggableState.inactive
    
    var body: some View {
//        tapView()
//        longPressView()
//        dragView()
//        zuheView1()
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .foregroundStyle(.green)
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
            .animation(.easeInOut, value: dragState.translation)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .sequenced(before: DragGesture())
                    // value: 手势的目前状态
                    // state: in-out属性，可以更新第一个参数的值
                    // transaction: 存储了目前状态处理更新的内容
                    .updating($dragState, body: { value, state, transaction in
                        switch value {
                        case .first(true):
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
                        default:
                            break
                        }
                    })
                    .onEnded({ value in
                        guard case .second(true, let drag?) = value else { return }
                        self.position.height += drag.translation.height
                        self.position.width += drag.translation.width
                    })
                )
    }
    
    //组合手势
    private func zuheView1() -> some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .opacity(pressed ? 0.5 : 1.0)
            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
            .animation(.easeInOut, value: dragOffset)
            .foregroundStyle(.green)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .updating($pressed, body: { currentState, state, transaction in
                        print("111")
                        state = currentState
                    })
                    .sequenced(before: DragGesture())
                    .updating($dragOffset, body: { value, state, transaction in
                        switch value {
                        case .first(true):
                            print("Tapping")
                        case .second(true, let drag):
                            state = drag?.translation ?? .zero
                        default:
                            break
                        }
                    })
                    .onEnded({ value in
                        guard case .second(true, let drag?) = value else { return }
                        self.position.height += drag.translation.height
                        self.position.width = drag.translation.width
                    })
            )
    }
    
    // 拖动手势
    private func dragView() -> some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
            .animation(.easeInOut, value: dragOffset)
            .foregroundStyle(.green)
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { value, state, transaction in
                        state = value.translation
                    })
                    .onEnded({ value in
                        self.position.height += value.translation.height
                        self.position.width += value.translation.width
                    })
            )
    }
    
    private func longPressView() -> some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .opacity(longPressTap ? 0.4 : 1.0)
            .scaleEffect(isPressed ? 0.5 : 1.0)
            .animation(.easeInOut, value: isPressed)
            .foregroundStyle(.green)
            .gesture(
                LongPressGesture()
                    .updating($longPressTap, body: { currentState, state, transaction in
                        print("\(state)")
                        state = currentState
                    })
                    .onEnded({ _ in
                        self.isPressed.toggle()
                    })
            )
        // updating不生效
        // 可以用onLongPressGesture
//            .onLongPressGesture(minimumDuration: 1.0, perform: {
//                print("222")
//            }, onPressingChanged: { state in
//                print("\(state)")
//            })
    }
    
    private func tapView() -> some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .scaleEffect(isPressed ? 0.5 : 1.0)
            .animation(.easeInOut, value: isPressed)
            .foregroundStyle(.green)
            .gesture(
                TapGesture()
                    .onEnded({
                        self.isPressed.toggle()
                    })
            )
    }
}

#Preview {
    SwiftUIGestureView()
}

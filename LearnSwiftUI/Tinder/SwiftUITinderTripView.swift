//
//  SwiftUITinderTripView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/24.
//

import SwiftUI

struct SwiftUITinderTripView: View {
    
    @GestureState private var dragState = TinderTripDraggableState.inactive
    private let dragThreshold: CGFloat = 80.0
    
    @State var cardViews: [TinderTripCardView] = {
        var views = [TinderTripCardView]()
        for index in 0..<2 {
            views.append(TinderTripCardView(image: trips[index].image, title: trips[index].destination))
        }
        return views
    }()
    
    @State private var lastIndex = 1
    @State private var removalTransition = AnyTransition.tinderTrailingBottom
    
    var body: some View {
        VStack {
            TopBarMenu()
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay {
                            ZStack {
                                Image(systemName: "x.circle")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 100))
                                    .opacity(dragState.translation.width < -dragThreshold && isTopCard(cardView: cardView) ? 1.0 : 0)
                                Image(systemName: "heart.circle")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 200))
                                    .opacity(dragState.translation.width > dragThreshold && isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        }
                        .offset(x: isTopCard(cardView: cardView) ? dragState.translation.width : 0, y: isTopCard(cardView: cardView) ? dragState.translation.height : 0)
                        .scaleEffect(dragState.isDragging && isTopCard(cardView: cardView) ? 0.95 : 1)
                        .rotationEffect(Angle(degrees: isTopCard(cardView: cardView) ? Double(dragState.translation.width / 10) : 0))
                        .animation(.interpolatingSpring(stiffness: 180, damping: 100), value: dragState.translation)
                        .transition(removalTransition)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
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
                                .onChanged({ value in
                                    guard case .second(true, let drag?) = value else { return }
                                    if drag.translation.width < -dragThreshold {
                                        removalTransition = .tinderLeadingBottom
                                    }
                                    if drag.translation.width > dragThreshold {
                                        removalTransition = .tinderTrailingBottom
                                    }
                                })
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else { return }
                                    if drag.translation.width < -dragThreshold || drag.translation.width > dragThreshold {
                                        moveCard()
                                    }
                                })
                        )
                }
            }
            Spacer(minLength: 20)
            BottomBarMenu()
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        }
    }
    
    private func isTopCard(cardView: TinderTripCardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else { return false }
        return index == 0
    }
    
    private func moveCard() {
        cardViews.removeFirst()
        self.lastIndex += 1
        let trip = trips[lastIndex % trips.count]
        let newCardView = TinderTripCardView(image: trip.image, title: trip.destination)
        cardViews.append(newCardView)
    }
}

extension AnyTransition {
    static var tinderTrailingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var tinderLeadingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}

#Preview {
    SwiftUITinderTripView()
}

enum TinderTripDraggableState {
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
    
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
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

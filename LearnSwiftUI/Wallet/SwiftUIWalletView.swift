//
//  SwiftUIWalletView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/27.
//

import SwiftUI

struct SwiftUIWalletView: View {
    @State var cards: [WalletCard] = testCards
    private static let cardOffset: CGFloat = 50.0
    @State private var isCardPresented = false
    @State var isCardPressed = false
    @State var selectedCard: WalletCard?
    @GestureState private var dragState = WalletCardDragState.inactive
    
    var body: some View {
        VStack {
            WalletTopNavBar()
                .padding(.bottom)
            
            Spacer()
            
            ZStack {
                ForEach(cards) { card in
                    WalletCardView(card: card)
                        .padding(.horizontal, 35)
                        .zIndex(zIndex(for: card))
                        .offset(offset(for: card))
                    // 加入id修饰器，触发转场
                        .id(isCardPresented)
                        .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                        .animation(transitionAnimation(for: card), value: isCardPresented)
                        .gesture(
                            TapGesture()
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 0.15).delay(0.1)) {
                                        isCardPressed.toggle()
                                        selectedCard = isCardPressed ? card : nil
                                    }
                                })
                                .exclusively(before: LongPressGesture(minimumDuration: 0.05)
                                    .sequenced(before: DragGesture())
                                    .updating($dragState, body: { value, state, transaction in
                                            switch value {
                                            case .first(true):
                                                state = .pressing(index: index(for: card))
                                            case .second(true, let drag):
                                                state = .dragging(index: index(for: card), translation: drag?.translation ?? .zero)
                                            default:
                                                break
                                            }
                                        })
                                        .onEnded({ value in
                                            guard case .second(true, let drag?) = value else { return }
                                            // 重新排列卡片
                                            withAnimation(.spring()) {
                                                rearrangeCards(with: card, dragOffset: drag.translation)
                                            }
                                        })
                            )
                        )
                }
            }
            .onAppear() {
                isCardPresented.toggle()
            }
            
            if isCardPressed {
                TransactionHistoryView(transactions: testTransactions)
                    .padding(.top, 10)
                    .transition(.move(edge: .bottom))
            }
            
            Spacer()
        }
    }
    
    private func zIndex(for card: WalletCard) -> Double {
        guard let cardIndex = index(for: card) else {
            return 0.0
        }
        
        // 卡片预设z-index设定为卡片索引值为负值
        // 因此第一张卡片具有最大的z-index
        let defaultZIndex = -Double(cardIndex)
        
        // 如果它是拖拽的卡片
        if let draggingIndex = dragState.index,
           cardIndex == draggingIndex {
            // 我们根据位移的高度来计算新的z-index
            return defaultZIndex + Double(dragState.translation.height / Self.cardOffset)
        }
        
        return -Double(cardIndex)
    }
    
    private func index(for card: WalletCard) -> Int? {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
            return nil
        }
        return index
    }
    
    private func offset(for card: WalletCard) -> CGSize {
        guard let cardIndex = index(for: card) else {
            return CGSize()
        }
        if isCardPressed {
            guard let selectedCard = self.selectedCard,
                  let selectedCardIndex = index(for: selectedCard) else {
                return .zero
            }
            if cardIndex >= selectedCardIndex {
                return .zero
            }
            let offset = CGSize(width: 0, height: 1400)
            return offset
        }
        //Handle Drag
        var pressedOffset = CGSize.zero
        var dragOffsetY: CGFloat = 0.0
        if let draggingIndex = dragState.index,
           cardIndex == draggingIndex {
            pressedOffset.height = dragState.isPressing ? -20 : 0
            
            switch dragState.translation.width {
            case let width where width < -10:
                pressedOffset.width = -20
            case let width where width > 10:
                pressedOffset.width = 20
            default:
                break
            }
            dragOffsetY = dragState.translation.height
        }
        
        return CGSize(width: 0 + pressedOffset.width, height: -50 * CGFloat(cardIndex) + pressedOffset.height + dragOffsetY)
    }
    
    private func transitionAnimation(for card: WalletCard) -> Animation {
        var delay = 0.0
        if let index = index(for: card) {
            delay = Double(cards.count - index) * 0.1
        }
        return Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.02).delay(delay)
    }
    
    private func rearrangeCards(with card: WalletCard, dragOffset: CGSize) {
        guard let draggingCardIndex = index(for: card) else { return }
        var newIndex = draggingCardIndex + Int(-dragOffset.height / Self.cardOffset)
        newIndex = newIndex >= cards.count ? cards.count - 1 : newIndex
        newIndex = newIndex < 0 ? 0 : newIndex
        
        let removedCard = cards.remove(at: draggingCardIndex)
        cards.insert(removedCard, at: newIndex)
    }
    
}

struct WalletTopNavBar: View {
    var body: some View {
        HStack {
            Text("Wallet")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
            Spacer()
            Image(systemName: "plus.circle.fill")
                .font(.system(.title))
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
}

#Preview {
    SwiftUIWalletView()
}

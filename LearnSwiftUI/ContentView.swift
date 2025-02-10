//
//  ContentView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/24.
//

import SwiftUI

struct ContentView: View {
    
    enum SwiftUIDemoType: String, CaseIterable {
        case ActionSheet
        case Animation
        case AppstoreAnimation
        case BottomSheet
        case Button
        case Carousel
        case CoreGraphics
        case Form
        case FormRegister
        case Gesture
        case GridLayout
        case Image
        case KivaLoan
        case List
        case Navigation
        case PFinance
        case Present
        case ScrollView
        case Stack
        case State
        case Text
        case Tinder
        case ToDoListWithSearchBar
        case Wallet
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(SwiftUIDemoType.allCases, id: \.self) { type in
                    NavigationLink(destination: linkView(viewType: type)) {
                        Text(type.rawValue)
                            .font(.system(.headline))
                    }
                }
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("SwiftUI")
        }
        .padding()
    }
    
    private func linkView(viewType: SwiftUIDemoType) -> some View {
        HStack {
            switch viewType {
            case .ActionSheet:
                SwiftUIActionSheetView()
            case .Animation:
                SwiftUIAnimation()
            case .AppstoreAnimation:
                AppStoreAnimationView()
            case .BottomSheet:
                SwiftUIBottomSheetView()
            case .Button:
                SwiftUIButton()
            case .Carousel:
                SwiftUICarouselView()
            case .CoreGraphics:
                SwiftUIShape()
            case .Form:
                SwiftUIFormView().environmentObject(SettingStore())
            case .FormRegister:
                SwiftUIFormRegistrationView()
            case .Gesture:
                SwiftUIGestureView()
            case .GridLayout:
                SwiftUIMultiCafeView()
            case .Image:
                SwiftUIImage()
            case .KivaLoan:
                SwiftUIKivaLoanView()
            case .List:
                SwiftUIList()
            case .Navigation:
                SwiftUINavigationList()
            case .PFinance:
                SwiftUIPFinanceView()
            case .Present:
                SwiftUIPresentModal()
            case .ScrollView:
                SwiftUIScrollView()
            case .Stack:
                SwiftUIStacks()
            case .State:
                SwiftUIState()
            case .Text:
                SwiftUIText()
            case .Tinder:
                SwiftUITinderTripView()
            case .ToDoListWithSearchBar:
                ToDoListView()
            case .Wallet:
                SwiftUIWalletView()
            }
        }
    }
}

struct SwiftUIDemo<ContentView>: Identifiable where ContentView: View {
    var id = UUID()
    let name: String
    let view: ContentView
}

#Preview {
    NavigationStack {
        ContentView()
    }
}

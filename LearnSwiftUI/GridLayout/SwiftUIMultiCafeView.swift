//
//  SwiftUIMultiCafeView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/8.
//

import SwiftUI

struct SwiftUIMultiCafeView: View {
    
    // 检测屏幕方向的环境变量
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    @State var gridLayout = [ GridItem(.adaptive(minimum: 100)), GridItem(.flexible()) ]
    
    @State var showCoffeePhotos = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(sampleCafes) { cafe in
                        Image(cafe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(maxHeight: 150)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                        
                        if showCoffeePhotos {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                                ForEach(cafe.coffeePhotos) { photo in
                                    Image(photo.name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .frame(height: 50)
                                        .cornerRadius(10)
                                }
                            }
                            .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                            .animation(.easeIn, value: gridLayout.count)
                        }
                    }
                }
                .padding(10)
                .animation(.interactiveSpring(), value: gridLayout.count)
            }
            .navigationTitle("Coffee Feed")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            self.showCoffeePhotos.toggle()
                        } label: {
                            Image(systemName: "squares.below.rectangle")
                                .font(.title)
                        }
                        
                        Button {
                            let minWidth: CGFloat = {
                                // iPhone landscape mode
                                if verticalSizeClass == .compact {
                                    return 250.0
                                }
                                
                                //iPad
                                if horizontalSizeClass == .regular && verticalSizeClass == .regular {
                                    return 500
                                }
                                
                                return 100
                            }()
                            
                            gridLayout = gridLayout.count % 2 == 0 ?  [ GridItem() ] : [ GridItem(.adaptive(minimum: minWidth)), GridItem(.flexible()) ]
                        } label: {
                            Image(systemName: "square.grid.2x2")
                                .font(.title)
                        }
                    }
                }
            }
        }
        .onChange(of: verticalSizeClass) {
            self.gridLayout = [ GridItem(.adaptive(minimum: verticalSizeClass == .compact ? 100 : 250)), GridItem(.flexible())]
        }
        .onAppear() {
            switch (horizontalSizeClass, verticalSizeClass) {
            case (.compact, .regular):
                // iPhone Portrait
                self.gridLayout = [ GridItem() ]
            case (.compact, _):
                // iPhone Landscape
                self.gridLayout = [ GridItem(.adaptive(minimum: 250)), GridItem(.flexible()) ]
            case (.regular, .regular):
                // iPad
                self.gridLayout = [ GridItem(.adaptive(minimum: 500.0)), GridItem(.flexible()) ]
            default:
                break
            }
        }
    }
}

#Preview {
    SwiftUIMultiCafeView()
}

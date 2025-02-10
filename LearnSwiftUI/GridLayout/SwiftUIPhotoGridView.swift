//
//  SwiftUIPhotoGridView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/8.
//

import SwiftUI

struct SwiftUIPhotoGridView: View {
    
    @State var gridLayout: [GridItem] = [GridItem()]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(samplePhotos.indices, id: \.self) { index in
                        Image(samplePhotos[index].name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: gridLayout.count == 1 ? 200 : 100)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                    }
                }
                .padding(10)
                .animation(.interactiveSpring(), value: gridLayout.count)
            }
            .navigationTitle("Coffee Feed")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.gridLayout = Array(repeating: GridItem(.flexible()), count: self.gridLayout.count % 4 + 1)
                    } label: {
                        Image(systemName: "square.grid.2x2")
                            .font(.title)
                    }
                    .tint(.primary)
                }
            }
        }
    }
}

#Preview {
    SwiftUIPhotoGridView()
}

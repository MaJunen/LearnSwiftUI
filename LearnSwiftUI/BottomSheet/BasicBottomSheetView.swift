//
//  BasicBottomSheetView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/24.
//

import SwiftUI

struct BasicBottomSheetView: View {
    
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            Button {
                showSheet.toggle()
            } label: {
                Text("Show Bottom Sheet")
            }
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $showSheet) {
                Text("This is the expamdable botton sheet.")
                    .presentationDetents([.medium, .large])
            }
            Spacer()
        }
    }
}

#Preview {
    BasicBottomSheetView()
}

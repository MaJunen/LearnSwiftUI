//
//  PFBlankView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/7.
//

import SwiftUI

struct PFBlankView: View {
    var bgColor: Color
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    PFBlankView(bgColor: .black)
}

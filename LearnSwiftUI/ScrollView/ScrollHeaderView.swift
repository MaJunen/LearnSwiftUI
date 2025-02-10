//
//  ScrollHeaderView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/27.
//

import SwiftUI

struct ScrollHeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text("MONDAY, AUG 20")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                Text("Your Reading")
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundStyle(.primary)
                    .fontWeight(.black)
            }
            Spacer()
        }
        .padding([.top, .horizontal])
    }
}

#Preview {
    ScrollHeaderView()
}

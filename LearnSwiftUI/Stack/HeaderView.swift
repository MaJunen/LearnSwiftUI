//
//  HeaderView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2024/12/26.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plain")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.semibold)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HeaderView()
}

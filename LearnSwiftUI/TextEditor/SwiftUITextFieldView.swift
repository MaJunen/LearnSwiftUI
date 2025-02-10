//
//  SwiftUITextFieldView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/10.
//

import SwiftUI

struct SwiftUITextFieldView: View {
    @State private var comment = ""
    
    var body: some View {
        TextField("Comment", text: $comment, prompt: Text("Please input your comment"), axis: .vertical)
            .padding()
            .background(.green.opacity(0.2))
            .cornerRadius(5.0)
            .padding()
            // 限制行数，或者行数范围
            .lineLimit(3...5)
    }
}

#Preview {
    SwiftUITextFieldView()
}

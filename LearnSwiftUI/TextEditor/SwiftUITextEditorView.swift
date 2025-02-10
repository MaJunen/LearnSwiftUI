//
//  SwiftUITextEditorView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/10.
//

import SwiftUI

struct SwiftUITextEditorView: View {
    @State private var inputText = ""
    @State private var wordCount: Int = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            TextEditor(text: $inputText)
                .font(.title)
                .lineSpacing(20)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled(true)
                .padding()
                .onChange(of: inputText) {
                    print("\($0) + \($1)")
                    let words = $1.split{ $0 == " " || $0.isNewline }
                    self.wordCount = words.count
                }
            
            Text("\(wordCount) words")
                .font(.headline)
                .foregroundStyle(.secondary)
                .padding(.trailing)
        }
    }
}

#Preview {
    SwiftUITextEditorView()
}

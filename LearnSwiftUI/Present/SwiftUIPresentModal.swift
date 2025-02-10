//
//  SwiftUIPresentModal.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/20.
//

import SwiftUI

struct SwiftUIPresentModal: View {
    
    @State var showDetailView = false
    @State var selectedArticle: NavigationArticle?
    
    var body: some View {
        NavigationStack {
            List(articles) { article in
                ZStack {
                    NavigationArticleRow(article: article)
                        .onTapGesture {
                            self.showDetailView = true
                            self.selectedArticle = article
                        }
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
//            .sheet(isPresented: $showDetailView, content: {
//                if let selectedArticle = self.selectedArticle {
//                    NavigationArticleDetailView(article: selectedArticle)
//                }
//            })
            // 非全屏
//            .sheet(item: $selectedArticle, content: { article in
//                SwiftUIModalArticleDetail(article: article)
//            })
            // 全屏
            .fullScreenCover(item: $selectedArticle, content: { article in
                SwiftUIModalArticleDetail(article: article)
            })
            .navigationTitle("Your Reading")
        }
    }
}

#Preview {
    SwiftUIPresentModal()
}

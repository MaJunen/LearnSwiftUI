//
//  NavigationArticleDetailView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/20.
//

import SwiftUI

struct NavigationArticleDetailView: View {
    @Environment(\.dismiss) var dismiss
    var article: NavigationArticle
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
        }
        // 要明确navigationBar的样式inline
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    //返回前一个页面
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.largeTitle)
                }
                .tint(.white)
            }
        }
    }
}

#Preview {
    NavigationStack {
        NavigationArticleDetailView(article: articles[0])
            .navigationTitle("Article")
    }
}

//
//  SwiftUIArticle.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/20.
//

import SwiftUI

struct SwiftUIArticle: View {
    
    var articles = [
        Article(image: "flutter-app", title: "The Comprehensive Guide to the State Management in iOS", author: "BY ALEXEY NAUMOY", content: "There are many chagellenges in the software development,but there is one besat more offen than the other the pro blem"),
        Article(image: "macos-programming", title: "The Comprehensive Guide to the State Management in iOS", author: "BY ALEXEY NAUMOY", content: "There are many chagellenges in the software development,but there is one besat more offen than the other the pro blem"),
        Article(image: "natural-language-api", title: "The Comprehensive Guide to the State Management in iOS", author: "BY ALEXEY NAUMOY", content: "There are many chagellenges in the software development,but there is one besat more offen than the other the pro blem"),
        Article(image: "protocols", title: "The Comprehensive Guide to the State Management in iOS", author: "BY ALEXEY NAUMOY", content: "There are many chagellenges in the software development,but there is one besat more offen than the other the pro blem"),
        Article(image: "swiftui-button", title: "The Comprehensive Guide to the State Management in iOS", author: "BY ALEXEY NAUMOY", content: "There are many chagellenges in the software development,but there is one besat more offen than the other the pro blem"),
        Article(image: "state-management", title: "The Comprehensive Guide to the State Management in iOS", author: "BY ALEXEY NAUMOY", content: "There are many chagellenges in the software development,but there is one besat more offen than the other the pro blem"),
    ]
    
    var body: some View {
        List(articles) { article in
            SwiftUIArticleList(article: article)
        }
        .listStyle(.plain)
    }
}

struct SwiftUIArticleList: View {
    var article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
            Text(article.title)
                .font(.system(size: 30, weight: .black, design: .rounded))
                .foregroundStyle(.black)
            Text(article.author)
                .font(.system(.subheadline))
                .foregroundStyle(.gray)
            HStack(spacing: 3) {
                ForEach(0..<4) { _ in
                    Image(systemName: "star.fill")
                        .font(.system(size: 15))
                        .foregroundStyle(.yellow)
                    
                }
            }
            Text(article.content)
                .font(.system(.callout, design: .rounded))
                .foregroundStyle(.gray)
        }
    }
}

struct Article: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var author: String
    var content: String
}

#Preview {
    SwiftUIArticle()
}

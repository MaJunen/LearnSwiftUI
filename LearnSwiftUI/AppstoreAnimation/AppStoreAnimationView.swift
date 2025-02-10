//
//  AppStoreAnimationView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/7.
//

import SwiftUI

struct AppStoreAnimationView: View {
    @State private var showContent = false
    @State private var selectedArticleIndex: Int?
    
    @Namespace var nsArticle
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 40) {
                    AppStoreTopBarView()
                        .padding(.horizontal, 20)
                    
                    ForEach(sampleArticles.indices, id: \.self) { index  in
                        AppStoreArticleCardView(category: sampleArticles[index].category, headline: sampleArticles[index].headline, subHeadline: sampleArticles[index].subHeadline, image: sampleArticles[index].image, content: sampleArticles[index].content, isShowContent: $showContent)
                            .padding(.horizontal, 20)
                            .frame(height: min(sampleArticles[index].image.size.height/3, 500))
                            .matchedTransitionSource(id: index, in: nsArticle)
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.35, dampingFraction: 0.65, blendDuration: 0.1)) {
                                    self.selectedArticleIndex = index
                                    self.showContent.toggle()
                                }
                            }
                    }
                }
            }
            .opacity(showContent ? 0 : 1)
            if showContent, let selectedArticleIndex {
                AppStoreArticleCardView(category: sampleArticles[selectedArticleIndex].category, headline: sampleArticles[selectedArticleIndex].headline, subHeadline: sampleArticles[selectedArticleIndex].subHeadline, image: sampleArticles[selectedArticleIndex].image, content: sampleArticles[selectedArticleIndex].content, isShowContent: $showContent)
                    .matchedGeometryEffect(id: selectedArticleIndex, in: nsArticle)
                    .ignoresSafeArea()
            }
        }
    }
}

struct AppStoreTopBarView: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading) {
                Text(getCurrentDate().uppercased())
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text("Today")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            
            Spacer()
            
            AppStoreAvatarView(image: "profile", width: 40, height: 40)
        }
    }
    
    private func getCurrentDate(with format: String = "EEEE, MMM d") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
}

struct AppStoreAvatarView: View {
    let image: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
    }
}

#Preview {
    AppStoreAnimationView()
}

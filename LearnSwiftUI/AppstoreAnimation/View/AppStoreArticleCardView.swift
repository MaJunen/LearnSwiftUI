//
//  AppStoreArticleCardView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/7.
//

import SwiftUI

struct AppStoreArticleCardView: View {
    let category: String
    let headline: String
    let subHeadline: String
    let image: UIImage
    var content: String = ""
    @Binding var isShowContent: Bool
    
    var body: some View {
        // GeometryReader可以读取父视图的大小
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                ScrollView {
                    VStack(alignment: .leading) {
                        Image(uiImage: self.image)
                            .resizable()
                            .scaledToFill()
                        // 限制框架的宽度为屏幕大小
                            .frame(width: geometry.size.width, height: self.isShowContent ? geometry.size.height * 0.7 : min(self.image.size.height/3, 500))
                            .border(Color(.sRGB ,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), width: isShowContent ? 0 : 1)
                            .cornerRadius(15)
                            .overlay(
                                AppStoreArticleExcerptView(category: category, headline: headline, subHeadline: subHeadline, isShowContent: $isShowContent)
                                    .cornerRadius(isShowContent ? 0 : 15)
                            )
                        
                        // Content
                        if isShowContent {
                            Text(content)
                                .foregroundStyle(Color(.darkGray))
                                .font(.system(.body, design: .rounded))
                                .padding(.horizontal)
                                .padding(.bottom, 50)
                                .transition(.move(edge: .bottom))
                        }
                    }
                }
                .shadow(color: Color(.sRGB ,red: 64/255, green: 64/255, blue: 64/255, opacity: 0.3), radius: isShowContent ? 0 : 15)
                
                if isShowContent {
                    HStack {
                        Spacer()
                        
                        Button {
                            withAnimation(.easeOut) {
                                isShowContent = false
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 26))
                                .foregroundStyle(.white)
                                .opacity(0.7)
                        }
                    }
                    .padding(.top, 50)
                    .padding(.trailing)
                }
            }
        }
    }
}

#Preview {
    AppStoreArticleCardView(category: sampleArticles[0].category, headline: sampleArticles[0].headline, subHeadline: sampleArticles[0].subHeadline, image: sampleArticles[1].image, content: sampleArticles[0].content, isShowContent: .constant(true))
}

//
//  AppStoreArticleExcerptView.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/7.
//

import SwiftUI

struct AppStoreArticleExcerptView: View {
    let category: String
    let headline: String
    let subHeadline: String
    
    @Binding var isShowContent: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Rectangle()
                .frame(minHeight: 100, maxHeight: 150)
                .overlay {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(category.uppercased())
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.secondary)
                            Text(headline)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.primary)
                                // minimumScaleFactor系统会根据空间大小自动将字体缩小
                                .minimumScaleFactor(0.1)
                                .lineLimit(2)
                                .padding(.bottom, 5)
                            
                            if isShowContent {
                                Text(subHeadline)
                                    .font(.subheadline)
                                    .foregroundStyle(Color.secondary)
                                    .minimumScaleFactor(0.1)
                                    .lineLimit(3)
                            }
                        }
                        .padding()
                        
                        Spacer()
                    }
                }
        }
        .foregroundStyle(Color.white)
    }
}

#Preview {
    AppStoreArticleExcerptView(category: sampleArticles[0].category, headline: sampleArticles[0].headline, subHeadline: sampleArticles[0].subHeadline, isShowContent: .constant(true))
}

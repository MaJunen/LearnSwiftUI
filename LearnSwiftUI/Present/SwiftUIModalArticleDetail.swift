//
//  SwiftUIModalArticleDetail.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/1/20.
//

import SwiftUI

struct SwiftUIModalArticleDetail: View {
    @Environment(\.dismiss) var dismiss
    var article: NavigationArticle
    @State var showAlert: Bool = false
    
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
        .overlay {
            HStack {
                Spacer()
                
                VStack {
                    Button {
                        self.showAlert = true
                    } label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 40)
                    Spacer()
                }
            }
        }
        .alert("Warning", isPresented: $showAlert, actions: {
            Button{
                dismiss()
            } label: {
                Text("Confirm")
            }
            Button(role: .cancel, action: {}) {
                Text("Cancel")
            }
        }, message: {
            Text("Are you sure you want to leave?")
        })
        .ignoresSafeArea(.all, edges: .top)
    }
}

#Preview {
    NavigationStack {
        SwiftUIModalArticleDetail(article: articles[0])
    }
}

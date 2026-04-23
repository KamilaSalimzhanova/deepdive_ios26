//
//  NewsHeadlinesView.swift
//  NewsAppExample
//
//  Created by kamila on 23.04.2026.
//

import SwiftUI
import WebKit

struct NewsHeadlinesView: View {
    @State private var viewModel = NewsViewModel()
    
    let background: some View = LinearGradient(
        colors: [
            .blue.opacity(0.2),
            .purple.opacity(0.2),
            .blue.opacity(0.2)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    .blur(radius: 40)
    .ignoresSafeArea()
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                List {
                    ForEach(viewModel.articles.data) { article in
                        NavigationLink {
                            WebView(url: URL(string: article.url))
                        } label: {
                            ArticleRowView(data: article)
                        }
                        .listRowBackground(Color.white)
                    }
                }
                .scrollContentBackground(.hidden)
                
                if viewModel.isLoading {
                    Color.black.opacity(0.1)
                        .ignoresSafeArea()

                    ProgressView("fetching some data...")
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                }
            }
            .alert("Error", isPresented: .constant(viewModel.errorMessage != nil)) {
                Button {
                    viewModel.errorMessage = nil
                } label: {
                    Text("OK")
                }
            }
            .navigationTitle("Top headlines")
            .refreshable {
                await viewModel.fetchHeadlines()
            }
        }
    }
}

//#Preview {
//    NewsHeadlinesView()
//}

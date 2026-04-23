//
//  NewsViewModel.swift
//  NewsAppExample
//
//  Created by kamila on 23.04.2026.
//

import Foundation

@Observable
@MainActor
final class NewsViewModel {
    var articles = Article(data: [])
    var isLoading: Bool = false
    var errorMessage: String?
    
    init() {
        Task {
            await fetchHeadlines()
        }
    }
        
    func fetchHeadlines() async {
        isLoading = true
        errorMessage = nil
        
        let urlString = "https://api.thenewsapi.com/v1/news/all?api_token=\(Config.apiKey)&language=en&limit=3"
        
        guard let url = URL(string: urlString) else {
            isLoading = false
            errorMessage = "Url is invalid."
            
            return
        }
        
        do {
            let (data, error) = try await URLSession.shared.data(from: url)
            articles = try JSONDecoder().decode(Article.self, from: data)
        } catch {
            errorMessage = "Failed to fetch news because of the error \(error.localizedDescription)."
        }
        
        isLoading = false
    }
}

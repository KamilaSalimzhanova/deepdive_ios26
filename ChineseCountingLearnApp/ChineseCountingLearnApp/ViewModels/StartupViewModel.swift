//
//  StartupViewModel.swift
//  ChineseCountingLearnApp
//
//  Created by kamila on 26.04.2026.
//

import Foundation

@Observable
@MainActor
final class StartupViewModel {
    var proverbModel = ProverbModel.defaultQuote()
    
    var isLoading = true
    var navigateToGame = true
    
    func fetchProverb() async throws {
        self.isLoading = true
        defer { self.isLoading = false }
        
        guard let url = URL(string: "https://chinese-proverbs.onrender.com/api/proverbs/random") else {
            return
        }
        
        do {
            var request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            proverbModel = try JSONDecoder().decode(ProverbModel.self, from: data)
        } catch {
            print("failed to fetch quote. \(error.localizedDescription)")
        }
    }
}

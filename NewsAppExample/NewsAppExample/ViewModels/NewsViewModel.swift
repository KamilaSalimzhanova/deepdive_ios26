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
}

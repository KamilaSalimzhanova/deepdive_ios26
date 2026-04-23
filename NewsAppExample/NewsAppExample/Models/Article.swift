//
//  Article.swift
//  NewsAppExample
//
//  Created by kamila on 23.04.2026.
//

import Foundation

// MARK: - Article
struct Article: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable, Identifiable {
    var id = UUID()
    
    let title: String
    let description: String
    let url: String
    let imageURL: String
    let publishedAt: String

    enum CodingKeys: String, CodingKey {
        case title, description, url
        case imageURL = "image_url"
        case publishedAt = "published_at"
    }
}

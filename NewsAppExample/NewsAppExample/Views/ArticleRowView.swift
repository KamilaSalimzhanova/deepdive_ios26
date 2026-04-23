//
//  ArticleRowView.swift
//  NewsAppExample
//
//  Created by kamila on 23.04.2026.
//

import SwiftUI

struct ArticleRowView: View {
    let data: Datum
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: data.imageURL)) { phase in
                switch phase {
                case .empty:
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.thinMaterial)
                        .frame(width: 80, height: 80)
                        .overlay {
                            ProgressView()
                        }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                case .failure:
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.thinMaterial)
                        .frame(width: 80, height: 80)
                        .overlay {
                            Image(systemName: "photo")
                                .foregroundStyle(.secondary)
                        }
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading) {
                Text(data.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(data.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text(data.publishedAt)
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            }
        }
    }
}

#Preview {
    ArticleRowView(
        data: .init(
            title: "title fkvfkvkfvmfmv",
            description: "description fmfkvkfmvfk",
            url: "https://example.com",
            imageURL: "https://images.unsplash.com/photo-1591154669695-5f2a8d20c089?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            publishedAt: "02 October 2025"
        )
    )
}

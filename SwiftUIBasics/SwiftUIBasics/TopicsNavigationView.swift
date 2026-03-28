//
//  TopicsNavigationView.swift
//  SwiftUIBasics
//
//  Created by kamila on 28.03.2026.
//

import SwiftUI

struct TopicsNavigationView: View {
    let topics: [TopicModel] = [
        TopicModel(
            topicType: .simple,
            title: "Simple text view with rotation effect"
        )
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(topics) { topic in
                        NavigationLink(destination: destinationView(for: topic)) {
                            TopicCardView(title: topic.title)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("SwiftUI Topics")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    @ViewBuilder
    private func destinationView(for topic: TopicModel) -> some View {
        switch topic.topicType {
        case .simple:
            ContentView()
        }
    }
}


#Preview {
    TopicsNavigationView()
}

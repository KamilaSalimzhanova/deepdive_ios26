//
//  TopicModel.swift
//  SwiftUIBasics
//
//  Created by kamila on 28.03.2026.
//

import Foundation

struct TopicModel: Identifiable {
    let id = UUID()
    let topicType: TopicType
    let title: String
    
    enum TopicType {
        case simple
    }
}

//
//  Options.swift
//  ChineseCountingLearnApp
//
//  Created by kamila on 26.04.2026.
//

import Foundation

struct Options: Identifiable, Equatable {
    let id = UUID()
    let number: Int
    let chinese: String
    let pinyin: String
    
    static let defaultOption: Options = .init(number: 1, chinese: "一", pinyin: "yī")
}

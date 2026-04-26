//
//  ProverbModel.swift
//  ChineseCountingLearnApp
//
//  Created by kamila on 26.04.2026.
//
import Foundation

struct ProverbModel: Codable {
    let id, proverb, pinyin, translation: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case proverb, pinyin, translation
    }
    
    static func defaultQuote() -> ProverbModel {
        ProverbModel(
            id: "12345",
            proverb: "花有重开日，人无再少年",
            pinyin: "Huā yǒu chóng kāi rì, rén wú zài shào nián",
            translation: "Flowers may bloom again; you're never young again."
        )
    }
}

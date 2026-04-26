//
//  GameData.swift
//  ChineseCountingLearnApp
//
//  Created by kamila on 26.04.2026.
//

import Foundation

struct GameData {
    static func getRandomOptions() -> Options {
        GameData.allOptions.randomElement() ?? .defaultOption
    }
    
    static let allOptions: [Options] = (1...99).map { num in
        Options(number: num, chinese: chineseAndPinyin(for: num).chinese, pinyin: chineseAndPinyin(for: num).pinyin)
    }
    
    static func chineseAndPinyin(for number: Int) -> (chinese: String, pinyin: String) {
        let chienseDigits = ["","一","二","三","四","五","六","七","八","九","十"]
        let pinyinDigits = ["","yī","èr","sān","sì","wǔ","liù","qī","bā","jiǔ","shí"]
        
        if number <= 10 {
            return (chienseDigits[number], pinyinDigits[number])
        } else if number < 20 {
            return (chienseDigits[10] + chienseDigits[number%10], pinyinDigits[10] + pinyinDigits[number%10])
        } else {
            return (
                chienseDigits[number/10]+"十"+chienseDigits[number%10],
                pinyinDigits[number/10]+"shí"+pinyinDigits[number%10]
            )
        }
    }
}

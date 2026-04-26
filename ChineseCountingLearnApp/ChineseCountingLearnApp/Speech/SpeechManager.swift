//
//  SpeechManager.swift
//  ChineseCountingLearnApp
//
//  Created by kamila on 26.04.2026.
//

import Foundation
import AVFoundation

final class SpeechManager {
    static let shared = SpeechManager()
    
    private let synthesizer = AVSpeechSynthesizer()
    
    private init() {}
    
    //speak text in a given language
    func speak(_ text: String, in language: Language) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.rate = 0.45
        utterance.pitchMultiplier = 0.7
        utterance.volume = 1.0
        
        if let voice = AVSpeechSynthesisVoice(language: language.rawValue) {
            utterance.voice = voice
        } else {
            print("Language \(language.rawValue) not available")
        }
        
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        synthesizer.speak(utterance)
    }
    
    //speak chinese and english
    func speakChinese(_ text: String) {
        speak(text, in: .chinese)
    }
    
    func speakEnglish(_ text: String) {
        speak(text, in: .english)
    }
}

extension SpeechManager {
    enum Language: String {
        case chinese = "zh-CH"
        case english = "en-US"
    }
}

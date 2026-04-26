//
//  GameViewModel.swift
//  ChineseCountingLearnApp
//
//  Created by kamila on 26.04.2026.
//

import Foundation

@Observable
final class GameViewModel {
    var currentOption = GameData.getRandomOptions()
    var options: [Options] = []
    var currentQuestion = 1
    var score = 0
    var isGameOver = false
    var totalNumberOfQuestion: Int
    
    init(totalNumberOfQuestion: Int = 10) {
        self.totalNumberOfQuestion = totalNumberOfQuestion
        generateOptions()
    }
    
    func generateOptions() {
        options.append(currentOption)
        
        while options.count < 4 {
            let randomOption = GameData.getRandomOptions()
            if randomOption != options[0] && !options.contains(randomOption) {
                options.append(randomOption)
            }
        }
        
        options = options.shuffled()
    }
    
    func nextQuestion() {
        if currentQuestion >= totalNumberOfQuestion {
            isGameOver = true
        } else {
            currentQuestion += 1
            currentOption = GameData.getRandomOptions()
            generateOptions()
        }
    }
    
    func selectOption(_ selected: Options) {
        let isCorrect = selected == currentOption
        if isCorrect {
            score += 1
        }
        
        nextQuestion()
    }
    
    func resetGame() {
        score = 0
        currentQuestion = 1
        isGameOver = false
        currentOption = GameData.getRandomOptions()
        generateOptions()
    }
    
    func playAudio(_ text: String) {
        SpeechManager.shared.speakChinese(text)
    }
}

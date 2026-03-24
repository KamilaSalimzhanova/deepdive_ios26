//
//  LanguageOptionsView.swift
//  GreetingsApp
//
//  Created by kamila on 24.03.2026.
//

import SwiftUI

struct LanguageOptionsView: View {
    @Binding private(set) var language: String
    @Binding private(set) var languageDirection: String
        
    var body: some View {
        Menu {
            Button("English") {
                language = "en"
                languageDirection = LEFT_TO_RIGHT
            }
            Button("French") {
                language = "fr"
                languageDirection = LEFT_TO_RIGHT
            }
            Button("Russian") {
                language = "ru"
                languageDirection = LEFT_TO_RIGHT
            }
            Button("Arabic") {
                language = "ar"
                languageDirection = RIGHT_TO_LEFT
            }
        } label: {
            Image(systemName: "gearshape.fill")
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    LanguageOptionsView(language: .constant("en"), languageDirection: .constant(LEFT_TO_RIGHT))
}

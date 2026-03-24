//
//  ContentView.swift
//  GreetingsApp
//
//  Created by kamila on 24.03.2026.
//

import SwiftUI

struct GreetingsView: View {
    @Binding private(set) var language: String
    @Binding private(set) var languageDirection: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                VStack(alignment: .leading) {
                    TitleView()
                    Spacer()
                    MessagesView()
                    Spacer()
                    Spacer()
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    LanguageOptionsView(language: $language, languageDirection: $languageDirection)
                }
            }
        }
    }
}

#Preview {
    GreetingsView(language: .constant("en"), languageDirection: .constant(LEFT_TO_RIGHT))
}

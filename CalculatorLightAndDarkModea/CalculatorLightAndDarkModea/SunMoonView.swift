//
//  SunMoonView.swift
//  CalculatorLightAndDarkModea
//
//  Created by kamila on 16.04.2026.
//

import SwiftUI

struct SunMoonView: View {
    var lightMode: Bool
    
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: "sun.min")
            Image(systemName: "moon")
        }
        .imageScale(.large)
        .foregroundStyle(
            lightMode ? sunOrMoonSelected : sunOrMoonNotSelected
        )
        .padding()
        .background(secondaryBackgroundColor)
        .cornerRadius(20)
    }
}

#Preview {
    SunMoonView(lightMode: true)
}

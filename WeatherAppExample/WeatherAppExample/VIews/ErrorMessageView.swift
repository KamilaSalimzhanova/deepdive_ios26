//
//  ErrorMessageView.swift
//  WeatherAppExample
//
//  Created by kamila on 23.04.2026.
//

import SwiftUI

struct ErrorMessageView: View {
    private let friendlyMessages = [
        "Something went wrong, please try again.",
        "No internet connection, please check your settings.",
        "Weather data is not available for this location."
    ]
    
    var message: String {
        friendlyMessages.randomElement() ?? "Something went wrong, please try again."
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "cloud.drizzle.fill")
                .font(.largeTitle)
            Text("Weather unavailable.")
                .font(.headline)
            Text(message)
                .font(.subheadline)
                .bold()
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [.blue, .teal],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(.rect(cornerRadius: 20))
        .shadow(radius: 10)
        .padding()
        .foregroundStyle(.white.opacity(0.9))
    }
}

#Preview {
    ErrorMessageView()
}

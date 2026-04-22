//
//  WeatherViewCustomTextfield.swift
//  WeatherAppExample
//
//  Created by kamila on 22.04.2026.
//

import SwiftUI

struct WeatherViewCustomTextfield: View {
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)

            TextField("Enter city name", text: $text)
                .textFieldStyle(.plain)
                .textInputAutocapitalization(.words)
                .disableAutocorrection(true)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(.ultraThinMaterial)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .strokeBorder(.quaternary ,lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        .transition(.opacity)
        .animation(.smooth, value: text)
    }
}

#Preview {
    WeatherViewCustomTextfield(text: .constant("city name"))
}

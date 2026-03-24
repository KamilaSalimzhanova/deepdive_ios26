//
//  TextView.swift
//  GreetingsApp
//
//  Created by kamila on 24.03.2026.
//

import SwiftUI

struct TextView: View {
    let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange]
    let text: String
    @State private(set) var textColor: Color
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding()
            .background(textColor.opacity(0.4))
            .cornerRadius(20.0)
            .shadow(color: textColor, radius: 5, x: 10, y: 10)
            .onTapGesture {
                textColor = colors.randomElement() ?? .red
            }
    }
}

#Preview {
    TextView(text: "hello there", textColor: .green)
}

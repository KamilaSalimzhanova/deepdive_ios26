//
//  TitleView.swift
//  GreetingsApp
//
//  Created by kamila on 24.03.2026.
//

import SwiftUI

struct TitleView: View {
    var angle: Angle {
        isRotated ? .zero : Angle(degrees: 360)
    }
    var angularGradient: AngularGradient {
        .init(
            gradient:Gradient(colors: [.red, .green, .blue, .purple, .orange, .yellow]),
            center: .center,
            angle: .zero)
    }
    let lineWidth = 15.0
    let diameter = 70.0
    let captions = [
        "Exploring iOS Programming",
        "Learning how to bake",
        "Programming Recipes"
    ]
    
    @State private(set) var isRotated: Bool = false
    @State private(set) var captionText: String = "Exploring iOS Programming"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Greetings")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(captionText)
                    .font(.headline)
                    .fontWeight(.thin)
            }
            .onTapGesture {
                captionText = captions.randomElement() ?? ""
            }
            Spacer()
            Circle()
                .strokeBorder(angularGradient, lineWidth: lineWidth)
                .rotationEffect(angle)
                .frame(width: diameter, height: diameter)
                .onTapGesture {
                    withAnimation {
                        isRotated.toggle()
                    }
                }
        }
    }
}

#Preview {
    VStack {
        TitleView()
        Spacer()
    }
    .padding()
}

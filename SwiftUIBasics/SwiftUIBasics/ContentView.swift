//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by kamila on 28.03.2026.
//

import SwiftUI

struct ContentView: View {
    var text: String {
        isTapped
        ? "Swift UI Basics"
        : "To know that u know and what u do not know, that is true knowledge"
    }
    var rotationAngle: CGFloat {
        isTapped ? .zero : 360.0
    }
    
    @State private var colorList: [Color] = [.red, .purple, .green, .pink]
    @State private var isTapped: Bool = false
        
    var body: some View {
        ZStack {
            LinearGradient(
                colors: colorList,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .opacity(0.5)
            .ignoresSafeArea()
            
            Text(text)
                .font(isTapped ? .largeTitle : .title)
                .fontWeight(.semibold)
                .foregroundStyle(isTapped ? .black : .red)
                .multilineTextAlignment(.center)
                .rotation3DEffect(.degrees(rotationAngle), axis: (x: 0, y: 1, z: 0))
                .padding()
        }
        .onTapGesture {
            withAnimation(.easeIn(duration: 1.5)){
                isTapped.toggle()
                colorList.shuffle()
            }
        }
    }
}

#Preview {
    ContentView()
}

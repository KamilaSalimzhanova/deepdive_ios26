//
//  ContentView.swift
//  DataFlowSwiftUI
//
//  Created by kamila on 30.03.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var color1: Color = .red
    @State private var color2: Color = .green
    @State private var color3: Color = .blue
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2).ignoresSafeArea()
            VStack {
                HStack {
                    RectangleView(dim: 50, color: color1)
                    RectangleView(dim: 50, color: color2)
                    RectangleView(dim: 50, color: color3)
                }
                .padding(.vertical)
                
                CustomColorPicker(selectedColor: $color1, text: "Left")
                CustomColorPicker(selectedColor: $color2, text: "Middle")
                CustomColorPicker(selectedColor: $color3, text: "Right")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

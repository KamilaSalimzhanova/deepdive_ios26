//
//  CustomColorPicker.swift
//  DataFlowSwiftUI
//
//  Created by kamila on 30.03.2026.
//

import SwiftUI

struct CustomColorPicker: View {
    @Binding var selectedColor: Color
    let text: String
    let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .pink, .indigo, .gray, .black, .brown, .purple, .orange, .cyan, .mint, .teal, .white, .purple, .green]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(colors, id: \.self) { color in
                        ColorCircle(color: color, isSelected: selectedColor == color)
                            .onTapGesture {
                                withAnimation {
                                    selectedColor = color
                                }
                            }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 7)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
    }
}

#Preview {
    CustomColorPicker(selectedColor: .constant(.red), text: "Color")
}

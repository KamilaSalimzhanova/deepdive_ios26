//
//  ColorCircle.swift
//  DataFlowSwiftUI
//
//  Created by kamila on 30.03.2026.
//

import SwiftUI

struct ColorCircle: View {
    var dim: CGFloat {
        isSelected ? selectedDim : notSelectedDim
    }
    
    let color: Color
    let isSelected: Bool
    let selectedDim = 30.0
    let notSelectedDim = 20.0
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: dim, height: dim)
    }
}

#Preview {
    VStack {
        ColorCircle(color: .blue, isSelected: true)
        ColorCircle(color: .red, isSelected: false)
    }
}

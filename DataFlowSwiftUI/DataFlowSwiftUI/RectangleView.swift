//
//  RectangleView.swift
//  DataFlowSwiftUI
//
//  Created by kamila on 30.03.2026.
//

import SwiftUI

struct RectangleView: View {
    let dim: CGFloat
    let color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(color)
            .frame(width: dim, height: dim)
    }
}

#Preview {
    RectangleView(dim: 50, color: .blue)
}

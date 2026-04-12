//
//  BackgroundView.swift
//  SwiftUIBeautifulAdvancedAnimations
//
//  Created by kamila on 12.04.2026.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        MeshGradient(
            width: 2,
            height: 2,
            points: [[0, 0], [1, 0], [0, 1], [1, 1]],
            colors: [.pink, .indigo, .yellow, .red]
        )
        .opacity(0.4)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}

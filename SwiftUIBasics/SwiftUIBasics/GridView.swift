//
//  GridView.swift
//  SwiftUIBasics
//
//  Created by kamila on 28.03.2026.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5).ignoresSafeArea()
            Grid {
                GridRow {
                    Rect(color: .red, count: 2, sum: 3)
                    Rect(color: .blue, count: 1, sum: 3)
                }
                GridRow {
                    Rect(color: .green, count: 1, sum: 3)
                    Rect(color: .yellow, count: 1, sum: 3)
                    Rect(color: .blue, count: 1, sum: 3)
                }
            }
            .padding()
        }
    }
}

struct Rect: View {
    var text: String {
        "\(count) out of \(sum)"
    }
    let color: Color
    let count: Int
    let sum: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(color.opacity(0.5))
            .overlay {
                Text(text)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .gridCellColumns(count)
    }
}

#Preview {
    GridView()
}

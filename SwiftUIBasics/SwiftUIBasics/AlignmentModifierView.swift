//
//  alignmentModifierView.swift
//  SwiftUIBasics
//
//  Created by kamila on 28.03.2026.
//

import SwiftUI

struct AlignmentModifier: ViewModifier {
    let alignment: Alignment
    
    init(alignment: Alignment = .center) {
        self.alignment = alignment
    }
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}

struct AlignmentModifierView: View {
    var body: some View {
        ZStack {
            Text("Upper left")
                .align(alignment: .topLeading)
            Text("Upper")
                .align(alignment: .top)
            Text("Upper right")
                .align(alignment: .topTrailing)
            
            Text("Center left")
                .align(alignment: .leading)
            Text("Center")
                .align(alignment: .center)
            Text("Center right")
                .align(alignment: .trailing)
            
            Text("Lower left")
                .align(alignment: .bottomLeading)
            Text("Lower")
                .align(alignment: .bottom)
            Text("Lower right")
                .align(alignment: .bottomTrailing)
        }
        .foregroundStyle(.blue)
        .padding()
    }
}

extension View {
    func align(alignment: Alignment) -> some View {
        self.modifier(AlignmentModifier(alignment: alignment))
    }
}

#Preview {
    AlignmentModifierView()
}

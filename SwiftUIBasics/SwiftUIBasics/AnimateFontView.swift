//
//  AnimateFont.swift
//  SwiftUIBasics
//
//  Created by kamila on 28.03.2026.
//

import SwiftUI

struct AnimateFontView: View {
    var font: Font {
        toggleFont ? .largeTitle : .caption
    }
    @State private var toggleFont: Bool = false
    var body: some View {
        ZStack {
            Color
                .purple
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                    .font(font)
                    .fontWeight(.bold)
                Spacer()
                Button {
                    withAnimation {
                        toggleFont.toggle()
                    }
                } label: {
                    Text("click me")
                        .font(.title)
                        .fontWeight(.semibold)
                }

            }
            .padding()
        }
    }
}

#Preview {
    AnimateFontView()
}

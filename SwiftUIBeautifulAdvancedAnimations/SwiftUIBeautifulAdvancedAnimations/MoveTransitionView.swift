//
//  MoveTransitionView.swift
//  SwiftUIBeautifulAdvancedAnimations
//
//  Created by kamila on 12.04.2026.
//

import SwiftUI

struct MoveTransitionView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var path: [Route]
    @State private var show = true
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("dismiss")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    
                    Button("Home screen") {
                        path = []
                    }
                    .capsuleButton()
                    
                    Button("Next view") {
                        path.append(.slide)
                    }
                    .capsuleButton()
                }
                .padding()
                Spacer()
                
                if show {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.cyan.gradient)
                        .frame(width: 200, height: 200)
                        .transition(.move(edge: .bottom))
                }
                
                Spacer()
                
                Button(show ? "hide" : "show") {
                    withAnimation {
                        show.toggle()
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
            }
        }
    }
}

#Preview {
    MoveTransitionView(path: .constant([]))
}

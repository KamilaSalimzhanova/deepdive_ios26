//
//  AssymetricTransitionView.swift
//  SwiftUIBeautifulAdvancedAnimations
//
//  Created by kamila on 16.04.2026.
//

import SwiftUI

struct AssymetricTransitionView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var path: [Route]
    @State private var show = false
    
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
                        path.append(.combined)
                    }
                    .capsuleButton()
                }
                .padding()
                Spacer()
                
                if show {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.orange.gradient)
                        .frame(width: 200, height: 200)
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .top),
                                removal: .scale
                            )
                        )
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
    AssymetricTransitionView(path: .constant([]))
}

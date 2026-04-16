//
//  SlideTransitionView.swift
//  SwiftUIBeautifulAdvancedAnimations
//
//  Created by kamila on 16.04.2026.
//

import SwiftUI

struct SlideTransitionView: View {
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
                        path.append(.asymmetric)
                    }
                    .capsuleButton()
                }
                .padding()
                Spacer()
                
                if show {
                    Circle()
                        .fill(.indigo.gradient)
                        .frame(width: 200, height: 200)
                        .transition(.slide)
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
    SlideTransitionView(path: .constant([]))
}

//
//  ContentView.swift
//  SwiftUIBeautifulAdvancedAnimations
//
//  Created by kamila on 12.04.2026.
//

import SwiftUI

enum Route: Hashable {
    case move
    case slide
    case asymmetric
    case combined
}

struct ContentView: View {
    @State private var path: [Route] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            Form {
                Section("Built-in transitions") {
                    Button("Move transition") {
                        path.append(Route.move)
                    }
                    
                    Button("Slide transition") {
                        path.append(Route.slide)
                    }
                    Button("Asymmetric transition") {
                        path.append(Route.asymmetric)
                    }
                    
                    Button("Combined transition") {
                        path.append(Route.combined)
                    }
                }
                Section("Custom transitions") {
                    
                }
            }
            .tint(.black)
            .navigationTitle("Animation transitions")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .move:
                    MoveTransitionView(path: $path)
                        .hidesNavigationBarBackButton()
                case .slide:
                    Text("Slide View")
                case .asymmetric:
                    Text("Asymmetric")
                case .combined:
                    Text("Combined")
                }
            }
        }
    }
}

extension View {
    func hidesNavigationBarBackButton() -> some View {
        self.navigationBarBackButtonHidden()
    }
    
    func capsuleButton() -> some View {
        modifier(CapsuleButtonStyle())
    }
}

struct CapsuleButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.black)
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    ContentView()
}

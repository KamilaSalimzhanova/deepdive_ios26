//
//  ContentView.swift
//  LiquidGlassDemo
//
//  Created by kamila on 29.03.2026.
//

import SwiftUI

enum PersonType: String, CaseIterable, Identifiable {
    case female, male, skater, footballer
    
    var id: String { rawValue }
    
    var color: Color {
        switch self {
        case .female:
            return .pink
        case .male:
            return .blue
        case .skater:
            return .green
        case .footballer:
            return .orange
        }
    }
    
    var systemImage: String {
        switch self {
        case .female:
            "figure.stand.dress"
        case .male:
            "figure.stand"
        case .skater:
            "figure.skateboarding"
        case .footballer:
            "figure.american.football"
        }
    }
}

struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .frame(width: 60, height: 60)
            .glassEffect(.regular.tint(.red.opacity(0.7)))
    }
}

struct ContentView: View {
    var hStackSpacing: CGFloat {
        morph ? 30 : 0
    }
    
    @Namespace private var personNamespace
    @State private var selectedPerson: PersonType = .female
    @State private var morph = false
    
    var body: some View {
        ZStack {
            Image(.dog)
                .resizable()
                .scaledToFill()
                .opacity(0.8)
                .ignoresSafeArea()
            
            VStack {
                Text("Hello world!")
                    .padding()
                    .glassEffect()
                
                GlassEffectContainer(spacing: 30) {
                    HStack(spacing: hStackSpacing) {
                        Image(systemName: "scribble")
                            .modifier(ImageModifier())
                        Image(systemName: "eraser")
                            .modifier(ImageModifier())
                    }
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            morph.toggle()
                        }
                    }
                }
                
                GlassEffectContainer {
                    HStack(spacing: 24) {
                        ForEach(PersonType.allCases) { person in
                            Button {
                                selectedPerson = person
                            } label: {
                                Image(systemName: person.systemImage)
                                    .bold()
                                    .foregroundStyle(selectedPerson == person ? person.color : .secondary)
                            }
                            .buttonStyle(.glassProminent)
                            .glassEffectUnion(id: "test", namespace: personNamespace)
                        }
                    }
                    .font(.largeTitle)
                    .tint(.indigo.opacity(0.2))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

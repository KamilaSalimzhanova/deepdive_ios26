//
//  ContentView.swift
//  CalculatorLightAndDarkModea
//
//  Created by kamila on 16.04.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var lightMode: Bool = true
    @State private var currentComputation = ""
    @State private var mainResult = "0"
    
    var body: some View {
        ZStack {
            primaryBackgroundColor
                .ignoresSafeArea()
            
            VStack {
                SunMoonView(lightMode: lightMode)
                    .onTapGesture {
                        withAnimation {
                            lightMode.toggle()
                    }
                }
                
                Spacer()
                
                ComputationView(
                    currentComputation: currentComputation,
                    mainResult: mainResult
                )
                
                CalculatorButtonsView(
                    currentComputation: $currentComputation,
                    mainResult: $mainResult
                )
            }
            .padding()
        }
        .environment(\.colorScheme, lightMode ? .light : .dark)
    }
}

#Preview {
    ContentView()
}

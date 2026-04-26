//
//  StartupView.swift
//  ChineseCountingLearnApp
//
//  Created by kamila on 26.04.2026.
//

import SwiftUI

struct StartupView: View {
    @State private var vm = StartupViewModel()
    @State private var path: [Destination] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Chi")
                    .font(.system(size: 80, weight: .bold))
                    .padding()
                    .clipShape(Circle())
                    .foregroundStyle(.white)
                    .shadow(radius: 5)
                Spacer()
            }
            .padding()
            .navigationDestination(for: Destination.self) { dest in
                switch dest {
                case .game:
                    Text("gg")
                    //to do
                }
            }
        }
    }
}

enum Destination: Hashable {
    case game
}

#Preview {
    StartupView()
}

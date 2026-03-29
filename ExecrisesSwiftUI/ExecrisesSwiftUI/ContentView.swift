//
//  ContentView.swift
//  ExecrisesSwiftUI
//
//  Created by kamila on 29.03.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationLink {
                    BuyNowView(price: 20)
                } label: {
                    Text("Buy Now View")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
            .foregroundStyle(.black)
            .navigationTitle("Exercises")
        }
    }
}

#Preview {
    ContentView()
}

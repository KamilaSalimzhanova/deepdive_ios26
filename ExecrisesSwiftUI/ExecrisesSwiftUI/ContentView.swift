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
                VStack(spacing: 16) {
                    NavigationLink {
                        ZStack {
                            Color.black.opacity(0.2).ignoresSafeArea()
                            
                            VStack {
                                BuyNowView(price: 20, discountPercentage: 75)
                                BuyNowView(price: 20, discountPercentage: nil)
                            }
                        }
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Buy Now")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                Text("Tap to explore purchase flow")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.systemBackground))
                                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 3)
                        )
                    }
                    .buttonStyle(.plain)
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Exercises")
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  AI Assistant
//
//  Created by kamila on 21.04.2026.
//

import SwiftUI
import Playgrounds
import FoundationModels

struct ItemQueryView: View {
    @State private var itemName = "fruit"
    @State private var quantity: Double = 3
    @State private var errorMessage: String?
    @State private var isLoading = false
    @State private var response: String = "d;d"
    var prompt: String {
        if itemName.count < 3 { return "" }
        else { return quantity == 1 ? "Get me a \(itemName)." : "Get me \(quantity.formatted()) \(itemName)s."}
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    TextField("Item Name", text: $itemName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    VStack(spacing: 8) {
                        Text("Quantity: \(quantity.formatted())")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Slider(
                            value: $quantity,
                            in: 1...10,
                            step: 1
                        )
                        .padding(.horizontal)
                    }
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 5)
                
                Text(prompt)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button {
                    Task {
                        await generateItems()
                    }
                } label: {
                    if isLoading {
                        ProgressView()
                    } else {
                        Label("Generate", systemImage: "wand.and.stars")
                    }
                }
                .buttonStyle(.glassProminent)
                .controlSize(.large)
                .padding(.top)
                .disabled(itemName.count < 3)
                
                if !response.isEmpty {
                    GroupBox {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Model response")
                                .font(.headline)
                                .foregroundStyle(.primary)
                            
                            if let errorMessage {
                                Text("\(errorMessage)")
                                    .foregroundStyle(.red)
                                    .padding()
                            } else {
                                ScrollView {
                                    Text(LocalizedStringKey(response))
                                        .padding(.top, 4)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("AI assistant")
        }
    }
    
    private func generateItems() async {
        guard !prompt.isEmpty else {
            errorMessage = "Prompt is empty"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let session = LanguageModelSession()
            let responseString = try await session.respond(to: prompt)
            response = responseString.content
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}

#Preview {
    ItemQueryView()
}

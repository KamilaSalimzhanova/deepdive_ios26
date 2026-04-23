//
//  WeatherView.swift
//  WeatherAppExample
//
//  Created by kamila on 22.04.2026.
//

import SwiftUI

struct WeatherView: View {
    @AppStorage("useFarenheiht") private var useFarenheiht: Bool = false
    @State private var vm = WeatherViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                WeatherViewCustomTextfield(text: $vm.city)
                
                Button {
                    Task {
                        await vm.fetch()
                    }
                } label: {
                    Label(
                        "Get Weather",
                        systemImage: "cloud.sun.fill"
                    )
                }
                .buttonStyle(.borderedProminent)
                .disabled(vm.city.isEmpty)
                
                Spacer()
                if vm.isLoading {
                    ProgressView("Fetching weather info")
                        .padding()
                } else if let weather = vm.weatherResponse {
                    WeatherCardView(weather: weather, useFarenheiht: useFarenheiht)
                } else if let errorMessage = vm.errorMessage {
                    ErrorMessageView()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Weather app")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Menu {
                        Toggle(isOn: $useFarenheiht) {
                            Label("Use Farenheight", systemImage: "thermometer.sun")
                        }
                    } label: {
                        Image(systemName: "gear")
                    }

                }
            }
        }
    }
}

#Preview {
    WeatherView()
}

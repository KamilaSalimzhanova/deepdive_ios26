//
//  WeatherView.swift
//  WeatherAppExample
//
//  Created by kamila on 22.04.2026.
//

import SwiftUI

struct WeatherView: View {
    @State private var vm = WeatherViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                WeatherViewCustomTextfield(text: $vm.city)
                
                Button {
                    //to do
                } label: {
                    Label(
                        "Get Weather",
                        systemImage: "cloud.sun.fill"
                    )
                }
                .buttonStyle(.borderedProminent)
                
                if vm.isLoading {
                    ProgressView("Fetching weather info")
                        .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    WeatherView()
}

//
//  WeatherCardView.swift
//  WeatherAppExample
//
//  Created by kamila on 23.04.2026.
//

import SwiftUI

struct WeatherCardView: View {
    let weather: WeatherResponse
    let useFarenheiht: Bool
    
    var urlString: String {
        "https:\(weather.current.condition.icon)"
    }
    var displayTemp: String {
        useFarenheiht
        ? String(format: "%.1f°F", weather.current.tempF)
        : String(format: "%.1f°C", weather.current.tempC)
    }
    var displayFeelsLike: String {
        useFarenheiht
        ? String(format: "Feels like %.1f°F", weather.current.feelslikeF)
        : String(format: "Feels like %.1f°C", weather.current.feelslikeC)
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: urlString)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            
            Text("\(weather.location.name), \(weather.location.country)")
                .font(.title2)
                .bold()
            
            Text("\(displayTemp)")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
            
            Text("\(weather.current.condition.text)")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.9))
            
            Text("\(displayFeelsLike)")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.9))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [.blue, .teal],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(.rect(cornerRadius: 20))
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    WeatherCardView(weather:
            .init(
                location: .init(
                    name: "London",
                    country: "England"
                ),
                current: .init(
                    tempC: 30,
                    tempF: 50,
                    condition: .init(
                        text: "great wether",
                        icon: "some icon name"
                    ),
                    feelslikeC: 32.5,
                    feelslikeF: 52.5
                )
            ),
                    useFarenheiht: true
    )
}

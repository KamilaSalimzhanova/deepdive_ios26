//
//  WeatherViewModel.swift
//  WeatherAppExample
//
//  Created by kamila on 22.04.2026.
//

import Foundation

@Observable
final class WeatherViewModel {
    var city: String = ""
    var weatherResponse: WeatherResponse?
    var isLoading: Bool = false
    var errorMessage: String?
    
    @MainActor
    func fetch() async {
        isLoading = true
        
        do {
            weatherResponse = try await fetchData(for: self.city)
            errorMessage = nil
        } catch {
            if let weatherError = error as? WeatherError {
                errorMessage = weatherError.localizedDescription
            } else {
                errorMessage = "An unexpected error occurred \(error.localizedDescription)."
            }
            
            weatherResponse = nil
        }
        
        isLoading = false
    }
    
    private func fetchData(for city: String) async throws -> WeatherResponse {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(Config.apiKey)&q=\(city)&aqi=no"
        
        guard let url = URL(string: urlString) else {
            throw WeatherError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw WeatherError.unknown
        }
        
        guard httpResponse.statusCode == 200 else {
            throw WeatherError.requestFailed(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(WeatherResponse.self, from: data)
        } catch {
            throw WeatherError.decodingFailed
        }
    }
}


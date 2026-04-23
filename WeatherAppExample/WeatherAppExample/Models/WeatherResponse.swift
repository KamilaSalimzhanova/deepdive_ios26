//
//  WeatherResponse.swift
//  WeatherAppExample
//
//  Created by kamila on 22.04.2026.
//

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let location: Location
    let current: Current
}

// MARK: - Current
struct Current: Codable {
    let tempC: Double
    let tempF: Double
    let condition: Condition
    let feelslikeC: Double
    let feelslikeF: Double

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case tempF = "temp_f"
        case condition
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String
    let icon: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let country: String
}

//
//  WeatherError.swift
//  WeatherAppExample
//
//  Created by kamila on 23.04.2026.
//

import Foundation

enum WeatherError: LocalizedError {
    case invalidUrl
    case requestFailed(statusCode: Int)
    case decodingFailed
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            "Provided city name is invalid"
        case .requestFailed(let statusCode):
            "Failed with status code \(statusCode)"
        case .decodingFailed:
            "Unable to decode weather data."
        case .unknown:
            "An unknown error occurred"
        }
    }
}

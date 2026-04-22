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
}

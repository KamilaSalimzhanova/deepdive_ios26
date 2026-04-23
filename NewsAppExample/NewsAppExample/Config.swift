//
//  Config.swift
//  NewsAppExample
//
//  Created by kamila on 23.04.2026.
//

import Foundation

enum Config {
    static var apiKey: String {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API_KEY not found in Info.plist")
        }
        
        return apiKey
    }
}

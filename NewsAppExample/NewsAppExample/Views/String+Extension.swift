//
//  String+Extension.swift
//  NewsAppExample
//
//  Created by kamila on 24.04.2026.
//

import Foundation

extension String {
    func toFormattedDate() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        guard let date = formatter.date(from: self) else {
            return self
        }

        return date.formatted(.dateTime
            .day()
            .month(.abbreviated)
            .year()
            .hour()
            .minute()
        )
    }
}

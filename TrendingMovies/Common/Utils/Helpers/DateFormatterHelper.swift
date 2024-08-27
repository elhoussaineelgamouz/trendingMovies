//
//  DateFormatterHelper.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 27/8/2024.
//
import Foundation

struct DateFormatterHelper {
    static let shared = DateFormatterHelper()

    private let dateFormatter: DateFormatter

    private init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
    }

    func formatDate(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }

    func parseDate(_ dateString: String) -> Date? {
        return dateFormatter.date(from: dateString)
    }
}

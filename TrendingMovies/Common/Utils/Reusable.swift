//
//  Reusable.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 27/8/2024.
//

import Foundation

protocol Reusable {}

extension Reusable {
    static var reuseIndentifier: String { String(describing: self)}
}

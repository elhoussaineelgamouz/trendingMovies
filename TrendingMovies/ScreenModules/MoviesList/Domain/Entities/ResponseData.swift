//
//  ResponseData.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

struct ResponseData: Codable {
    let page: Int
    let results: [MovieItem]
    let total_pages: Int
    let total_results: Int
}

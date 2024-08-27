//
//  Endpoint.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

struct Endpoint {
    static let api_key = "c9856d0cb57c3f14bf75bdc6c063b8f3"
    static let baseUrl = "https://api.themoviedb.org/3/discover/movie?api_key=\(api_key)"
    static let baseMovieDetailsUrl = "https://api.themoviedb.org/3/movie/{movie_id}?api_key=\(api_key)"
    static let baseImageUrl = "https://image.tmdb.org/t/p/w500/"
}

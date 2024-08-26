//
//  MoviesListRepository.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

protocol MoviesListRepository {
    func fetchMoviesListData() async throws -> ResponseData
}

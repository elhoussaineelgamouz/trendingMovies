//
//  MovieDetailsRepository.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 27/8/2024.
//

protocol MovieDetailsRepository {
    func fetchMovieDetailsData() async throws -> MovieItem
}

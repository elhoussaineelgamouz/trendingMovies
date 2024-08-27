//
//  MovieDetailsRepositoryImp.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 27/8/2024.
//

import Foundation

struct MovieDetailsRepositoryImp: MovieDetailsRepository {

    let apiClientService: ApiClientService
    let urlList: String

    func fetchMovieDetailsData() async throws -> MovieItem {
        let url = URL(string: urlList)
        return try await apiClientService.request(url: url, type: MovieItem.self)
    }

}

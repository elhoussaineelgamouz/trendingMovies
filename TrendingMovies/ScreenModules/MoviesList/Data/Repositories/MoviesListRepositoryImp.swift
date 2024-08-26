//
//  MoviesListRepositoryImp.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import Foundation

struct MoviesListRepositoryImp: MoviesListRepository {
    let apiClientService: ApiClientService
    let urlList: String

    func fetchMoviesListData() async throws -> ResponseData {
        let url = URL(string: urlList)
        return try await apiClientService.request(url: url, type: ResponseData.self)
    }
}

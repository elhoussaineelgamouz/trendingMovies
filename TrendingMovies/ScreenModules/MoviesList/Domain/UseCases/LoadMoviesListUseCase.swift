//
//  LoadMoviesListUseCase.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

protocol LoadMoviesListUseCase {
    func execute() async -> Result<[MovieItem], Error>
}

struct LoadMoviesListUseCaseImp: LoadMoviesListUseCase {
    let moviesListRepository:  MoviesListRepository
    func execute() async -> Result<[MovieItem], Error> {
        do {
            let moviesListRepository = try await moviesListRepository.fetchMoviesListData()
            return .success(moviesListRepository.results)
        } catch {
            return .failure(error)
        }
    }
}

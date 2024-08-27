//
//  LoadMovieDetailsUseCase.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 27/8/2024.
//

protocol LoadMovieDetailsUseCase {
    func execute() async -> Result<MovieItem, Error>
}

struct LoadMovieDetailsUseCaseImp: LoadMovieDetailsUseCase {
    let movieDetailsRepository:  MovieDetailsRepository
    func execute() async -> Result<MovieItem, Error> {
        do {
            let movieDetailsRepository = try await movieDetailsRepository.fetchMovieDetailsData()
            return .success(movieDetailsRepository)
        } catch {
            return .failure(error)
        }
    }
}

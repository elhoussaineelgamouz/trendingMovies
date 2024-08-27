//
//  MovieDetailsFactory.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import UIKit
import Combine

protocol MovieDetailsFactory {
    func makeModule(coordinator: MovieDetailsViewControllerCoordinator, movieItem: MovieItem) -> UIViewController
}

struct MovieDetailsFactoryImp: MovieDetailsFactory {
    func makeModule(coordinator: MovieDetailsViewControllerCoordinator, movieItem: MovieItem) -> UIViewController {
        let apiClientService = ApiClientServiceImp()
        guard let movieId = movieItem.id else {
            return UIViewController()
        }
        let movieDetailsRepository = MovieDetailsRepositoryImp(apiClientService: apiClientService, urlList: "\(Endpoint.baseMovieDetailsUrl.replacingOccurrences(of: "{movie_id}", with: String(movieId)))")
        let loadMovieDetailsCase = LoadMovieDetailsUseCaseImp(movieDetailsRepository: movieDetailsRepository)
        let state = PassthroughSubject<StateController, Never>()
        let movieDetailsViewModel = MovieDetailsViewModelIpm(state: state, loadMovieDetailsUseCase: loadMovieDetailsCase)
        let controller = MovieDetailsViewController(viewModel: movieDetailsViewModel)
        return controller
    }
}

//
//  MoviesListFactory.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import Combine
import UIKit

protocol MoviesListFactory {
    func makeModel(coordinator: MoviesListFactoryControllerCoordinator) -> UIViewController
}

struct MoviesListFactoryImp: MoviesListFactory {
    func makeModel(coordinator: MoviesListFactoryControllerCoordinator) -> UIViewController {
        let apiClientService = ApiClientServiceImp()
        let moviesListRepository = MoviesListRepositoryImp(apiClientService: apiClientService, urlList: Endpoint.baseUrl)
        let loadMoviesListCase = LoadMoviesListUseCaseImp(moviesListRepository: moviesListRepository)
        let state = PassthroughSubject<StateController, Never>()
        let moviesListViewModel = MoviesListViewModelIpm(state: state, loadMoviesListUseCase: loadMoviesListCase)
        let moviesListController = MoviesListViewController(viewModel: moviesListViewModel, coordinator: coordinator)
        moviesListController.title = AppLocalized.appName
        return moviesListController
    }
}

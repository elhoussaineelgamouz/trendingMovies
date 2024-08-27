//
//  MoviesListCoordinator.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import UIKit
import Combine

final class MoviesListCoordinator: Coordinator {
    var navigation: UINavigationController
    private let moviesListFactory: MoviesListFactory!

    init(navigation: UINavigationController, moviesListFactory: MoviesListFactory!) {
        self.navigation = navigation
        self.moviesListFactory = moviesListFactory
    }

    func start() {
        let controller = moviesListFactory.makeModel(coordinator: self)
        navigation.pushViewController(controller, animated: false)
    }
}

extension MoviesListCoordinator: MoviesListFactoryControllerCoordinator {
    func didSelectItemMovieCell(movieItem: MovieItem) {
        let movieDetailsCoordinator = moviesListFactory.makeMovieDetailsCoordinator(navigation: navigation, movieItem: movieItem)
        movieDetailsCoordinator.start()
    }
}

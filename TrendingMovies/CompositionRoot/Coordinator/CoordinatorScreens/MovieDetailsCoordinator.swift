//
//  MovieDetailsCoordinator.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import UIKit

final class MovieDetailsCoordinator: Coordinator {
    var navigation: UINavigationController
    private var movieDetailsFactory: MovieDetailsFactory
    private var movieItem: MovieItem

    init(navigation: UINavigationController, movieDetailsFactory: MovieDetailsFactory, movieItem: MovieItem) {
        self.navigation = navigation
        self.movieDetailsFactory = movieDetailsFactory
        self.movieItem = movieItem
    }

    func start() {
        let controller = movieDetailsFactory.makeModule(coordinator: self, movieItem: self.movieItem)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}

extension MovieDetailsCoordinator: MovieDetailsViewControllerCoordinator {}

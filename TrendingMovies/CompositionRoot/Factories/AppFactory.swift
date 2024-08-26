//
//  AppFactory.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import UIKit

protocol AppFactory {
    func makeMoviesListCoordinator(navigation: UINavigationController) -> Coordinator
}

struct AppFactoryImp: AppFactory {
    func makeMoviesListCoordinator(navigation: UINavigationController) -> Coordinator {
        let moviesListFactory = MoviesListFactoryImp()
        let moviesListCoordinator = MoviesListCoordinator(navigation: navigation, moviesListFactory: moviesListFactory)
        return moviesListCoordinator
    }
}

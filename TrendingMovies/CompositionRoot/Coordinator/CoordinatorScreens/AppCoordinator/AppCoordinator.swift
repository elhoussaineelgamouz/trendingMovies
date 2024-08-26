//
//  AppCoordinator.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigation: UINavigationController
    private let appFactory: AppFactory
    private var movieslistCoordinator: Coordinator?

    init(navigation: UINavigationController, appFactory: AppFactory, window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        self.configWindow(window: window)
    }

    func start() {
        movieslistCoordinator = appFactory.makeMoviesListCoordinator(navigation: navigation)
        movieslistCoordinator?.start()
    }

    private func configWindow(window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}

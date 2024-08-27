//
//  MoviesListViewModel.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import Combine
import Foundation
import UIKit

protocol MoviesListViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    var moviesListItemsCount: Int { get }
    func viewDidLoad()
    func getItemMovieModel(indexPath: IndexPath) -> MovieItem
}

final class MoviesListViewModelIpm: MoviesListViewModel {
    var state: PassthroughSubject<StateController, Never>

    private let loadMoviesListUseCase: LoadMoviesListUseCase
    private var moviesListItems: [MovieItem] = []

    var moviesListItemsCount: Int {
        moviesListItems.count
    }

    init(state: PassthroughSubject<StateController, Never>, loadMoviesListUseCase: LoadMoviesListUseCase) {
        self.state = state
        self.loadMoviesListUseCase = loadMoviesListUseCase
    }

    func viewDidLoad() {
        Task {
            state.send(.loading)
            let result = await loadMoviesListUseCase.execute()
            updateUI(result: result)
        }
    }

    private func updateUI(result: Result<[MovieItem], Error>) {
        switch result {
        case .success(let moviesListItems):
            self.moviesListItems = moviesListItems
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }

    func getItemMovieModel(indexPath: IndexPath) -> MovieItem {
        return moviesListItems[indexPath.row]
    }
}

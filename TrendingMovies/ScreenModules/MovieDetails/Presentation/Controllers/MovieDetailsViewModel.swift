//
//  MovieDetailsViewModel.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 27/8/2024.
//

import Combine
import Foundation
import UIKit

protocol MovieDetailsViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    func getItemMovieModel() -> MovieItem
    func viewDidLoad()
}

final class MovieDetailsViewModelIpm: MovieDetailsViewModel {
    var state: PassthroughSubject<StateController, Never>

    private let loadMovieDetailsUseCase: LoadMovieDetailsUseCase
    private var movieItem: MovieItem?

    init(state: PassthroughSubject<StateController, Never>, loadMovieDetailsUseCase: LoadMovieDetailsUseCase) {
        self.state = state
        self.loadMovieDetailsUseCase = loadMovieDetailsUseCase
    }

    func viewDidLoad() {
        Task {
            state.send(.loading)
            let result = await loadMovieDetailsUseCase.execute()
            updateUI(result: result)
        }
    }

    private func updateUI(result: Result<MovieItem, Error>) {
        switch result {
        case .success(let movieItem):
            self.movieItem = movieItem
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }

    func getItemMovieModel() -> MovieItem {
        return self.movieItem!
    }
}

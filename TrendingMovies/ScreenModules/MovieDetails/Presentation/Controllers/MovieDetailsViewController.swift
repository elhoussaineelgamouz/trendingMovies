//
//  MovieDetailsViewController.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import UIKit
import Combine
import Kingfisher

protocol MovieDetailsViewControllerCoordinator {}

class MovieDetailsViewController: UIViewController {

    private let viewModel: MovieDetailsViewModel
    private var cancellable = Set<AnyCancellable>()

    @IBOutlet weak var movieImageImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    @IBOutlet weak var movieDescription: UILabel!

    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        stateController()
    }

    private func stateController() {
        viewModel
            .state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                switch state {
                case .success:
                    let movieItem = self?.viewModel.getItemMovieModel()
                    self?.movieNameLabel.text = movieItem?.title
                    let formattedDate = DateFormatterHelper.shared.parseDate(movieItem?.release_date ?? "")
                    self?.movieReleaseDateLabel.text = DateFormatterHelper.shared.formatDate(formattedDate ?? Date())
                    self?.movieDescription.text = movieItem?.overview
                    self?.movieImageImageView.kf.setImage(with: URL(string: Endpoint.baseImageUrl + (movieItem?.poster_path ?? "")))
                case .loading:
                    print("show spinner")
                case .fail(let error):
                    print("Unfortunately we have an error")
                }
            }.store(in: &cancellable)
    }
}

//
//  MoviesListViewController.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import UIKit
import Kingfisher
import Combine

protocol MoviesListFactoryControllerCoordinator: AnyObject {
    func didSelectItemMovieCell(movieItem: MovieItem)
}

class MoviesListViewController: UIViewController {

    @IBOutlet weak var moviesListTableView: UITableView!
    private let viewModel: MoviesListViewModel
    private var cancellable = Set<AnyCancellable>()
    private weak var coordinator: MoviesListFactoryControllerCoordinator?

    init(viewModel: MoviesListViewModel, coordinator: MoviesListFactoryControllerCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        stateController()
        setupTableView()
    }

    private func setupTableView() {
        self.moviesListTableView.register(UINib(nibName: "ItemMovieTableViewCell", bundle: nil), forCellReuseIdentifier: ItemMovieTableViewCell.reuseIndentifier)
        moviesListTableView.dataSource = self
        moviesListTableView.delegate = self
        moviesListTableView.separatorStyle = .none
        moviesListTableView.rowHeight = ViewValues.defaultHeightContainerCell
    }

    private func stateController() {
        viewModel
            .state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                switch state {
                case .success:
                    self?.moviesListTableView.reloadData()
                    self?.HideSpinner()
                case .loading:
                    self?.ShowSpinner()
                case .fail(let error):
                    self?.presentAlert(Message: error, title: AppLocalized.error)
                }
            }.store(in: &cancellable)
    }
}

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesListItemsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemMovieTableViewCell.reuseIndentifier, for: indexPath) as! ItemMovieTableViewCell
        let movieItem = viewModel.getItemMovieModel(indexPath: indexPath)
        cell.movieTitleLabel.text = movieItem.title
        let formattedDate = DateFormatterHelper.shared.parseDate(movieItem.release_date ?? "")
        cell.movieReleaseDateLabel.text = DateFormatterHelper.shared.formatDate(formattedDate ?? Date())
        cell.movieImage.kf.setImage(with: URL(string: Endpoint.baseImageUrl + (movieItem.poster_path ?? "")))
        return cell
    }
}

extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieItem = viewModel.getItemMovieModel(indexPath: indexPath)
        self.coordinator?.didSelectItemMovieCell(movieItem: movieItem)
    }
}

extension MoviesListViewController: SpinnerDisplayable {}
extension MoviesListViewController: MessageDisplayable {}

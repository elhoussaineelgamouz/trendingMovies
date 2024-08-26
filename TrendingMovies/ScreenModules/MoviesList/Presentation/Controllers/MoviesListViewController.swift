//
//  MoviesListViewController.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Combine

protocol MoviesListFactoryControllerCoordinator: AnyObject {
    func didSelectItemMovieCell(model: MovieItem)
}

class MoviesListViewController: UIViewController {

    let disposebag = DisposeBag()

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
        // Do any additional setup after loading the view.
    }

    private func setupTableView() {
        moviesListTableView.register(ItemMovieTableViewCell.self, forCellReuseIdentifier: "ItemMovieTableViewCell")
        moviesListTableView.dataSource = self
       }

    private func stateController() {
        viewModel
            .state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                switch state {
                case .success:
                    self?.moviesListTableView.reloadData()
                case .loading:
                    print("show spinner")
                case .fail(let error):
                    print("Unfortunately we have an error")
                }
            }.store(in: &cancellable)
    }
}

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesListItemsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemMovieTableViewCell", for: indexPath) as! ItemMovieTableViewCell
        let movieItem = viewModel.getItemMenuViewModel(indexPath: indexPath)
       // cell.ItemMovieName.text = ""
        return cell
    }
}

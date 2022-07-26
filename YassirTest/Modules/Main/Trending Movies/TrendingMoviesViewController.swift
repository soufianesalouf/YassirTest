//
//  TrendingMoviesViewController.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import UIKit
import Combine

class TrendingMoviesViewController: BaseViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var viewModel: TrendingMoviesViewModel!
    var didShowMovie: ((Int) -> Void)?
    
    // MARK: -
    
    private var disposables: Set<AnyCancellable> = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        setupBinding()
    }
    
    // MARK: - Actions
    
    @IBAction func movieDetailsPressed(_ sender: Any) {
        didShowMovie?(14)
    }
    
    // MARK: - Local Helpers
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        // Register Cells
        tableView.register(UINib.nib(named: MovieCell.identifier), forCellReuseIdentifier: MovieCell.identifier)
        
        // Set Empty Header
        tableView.tableHeaderView = UIView()
    }
    
    private func setupBinding() {
        viewModel.$success
            .sink{ [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &disposables)
        
        viewModel.$error
            .sink{ [weak self] error in
                guard let error = error else { return }
                self?.showAlert(title: i18n.somethingHappenedError, message: error.localizedDescription, defaultAction: i18n.okButton)
            }
            .store(in: &disposables)
    }
    
    private func setupNavigationBar() {
        let image = UIImage(named: "yassirSmallLogo.png")
        let imageView = UIImageView(image: image)
        self.navigationItem.titleView = imageView
    }
    
}

// MARK: - UITableView DataSource Methods

extension TrendingMoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier) as? MovieCell else { return UITableViewCell() }
        
        // Get the movie and configure the cell
        let movie = viewModel.getMovieViewModel(atIndex: indexPath.row)
        cell.configure(with: movie)
        
        return cell
    }
    
}

// MARK: - UITableView Delegate Methods

extension TrendingMoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didShowMovie?(viewModel.getMovieID(atIndex: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // If we are at last cell load more content
        if indexPath.row == viewModel.rowsCount - 1 && !viewModel.isLastPage {
            viewModel.shouldLoadMore = true
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
}


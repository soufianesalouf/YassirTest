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
            .sink{ error in
                guard let error = error else { return }
                print("Error: \(error.localizedDescription)")
            }
            .store(in: &disposables)
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
}


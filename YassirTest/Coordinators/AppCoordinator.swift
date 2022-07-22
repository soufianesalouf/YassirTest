//
//  AppCoordinator.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import UIKit
import Foundation

class AppCoordinator {
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()
    
    // MARK: - Public API
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    // MARK: - Start
    
    func start() {
        showTrendingMovies()
    }
    
    private func showTrendingMovies() {
        
        // Initiate and Configure Trending Movies View Controller
        let viewController =  TrendingMoviesViewController.instantiate()
        
        viewController.viewModel = TrendingMoviesViewModel(apiService: APIClient())
        viewController.didShowMovie = { [weak self] movieID in
            self?.showMovieDetails(for: movieID)
        }
        
        // Show the view controller
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showMovieDetails(for movieID: Int) {
        
        // Initialize and Configure Movie Detail View Controller
        let viewController = MovieDetailsViewController.instantiate()
        let viewModel = MovieDetailsViewModel(apiService: APIClient(), movieID: movieID)

        viewController.viewModel = viewModel

        // Push View Controller Into Navigation Stack
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

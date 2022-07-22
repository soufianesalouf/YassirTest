//
//  TrendingMoviesViewModel.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Foundation
import Combine

class TrendingMoviesViewModel: BaseViewModel {
    
    // MARK: - Published Properties
    
    @Published var success: Bool = false
    @Published var error: APIError? = nil
    
    // MARK: -
    
    private var trendingMovies: TrendingMovies = TrendingMovies(page: 1, movies: [], totalPages: 0)
    private let apiService: APIService
    private var disposables: Set<AnyCancellable> = []
    
    // MARK: - Init
    
    init(apiService: APIService, trendingMovies: TrendingMovies? = nil) {
        self.apiService = apiService
        self.trendingMovies = trendingMovies ?? TrendingMovies(page: 1, movies: [], totalPages: 0)
        fetchMovies()
    }
    
    // MARK: - Public Interfaces
    
    var rowsCount: Int {
        trendingMovies.movies.count
    }
    
    // MARK: - Functions
    
    func getMovieViewModel(atIndex index: Int) -> MovieCellViewModel {
        MovieCellViewModel(movie: trendingMovies.movies[index])
    }
    
    func getMovieID(atIndex index: Int) -> Int {
        trendingMovies.movies[index].id
    }
}

// MARK: - Networking

extension TrendingMoviesViewModel {
    
    private func fetchMovies() {
        
        apiService.movies()
            .sink (receiveCompletion: { [weak self] completion in
                
                switch completion {
                case .finished:
                    self?.success = true
                case .failure(let error):
                    self?.error = error
                }
            }, receiveValue: { [weak self] trendingMovies in
                self?.trendingMovies = trendingMovies
            }).store(in: &disposables)
    }
    
}

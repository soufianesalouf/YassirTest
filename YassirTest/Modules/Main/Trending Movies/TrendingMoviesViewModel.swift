//
//  TrendingMoviesViewModel.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Foundation
import Combine

class TrendingMoviesViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    var isLastPage: Bool = false
    
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
        fetchPosterConfiguration()
        fetchMovies(with: self.trendingMovies.page)
    }
    
    // MARK: - Public Interfaces
    
    var rowsCount: Int {
        trendingMovies.movies.count
    }
    
    var shouldLoadMore: Bool = false {
        didSet {
            loadMore()
        }
    }
    
    // MARK: - Functions
    
    func getMovieViewModel(atIndex index: Int) -> MovieCellViewModel {
        MovieCellViewModel(movie: trendingMovies.movies[index])
    }
    
    func getMovieID(atIndex index: Int) -> Int {
        trendingMovies.movies[index].id
    }
    
    // MARK: - Local Helpers
    
    private func loadMore() {
        if !isLastPage {
            isLastPage = trendingMovies.totalPages == trendingMovies.page
            fetchMovies(with: trendingMovies.page + 1)
        }
    }
    
}

// MARK: - Networking

extension TrendingMoviesViewModel {
    
    private func fetchMovies(with page: Int) {
        
        apiService.movies(page: page)
            .sink (receiveCompletion: { [weak self] completion in
                
                switch completion {
                case .finished:
                    self?.success = true
                case .failure(let error):
                    self?.error = error
                }
            }, receiveValue: { [weak self] trendingMovies in
                self?.trendingMovies.page = trendingMovies.page
                self?.trendingMovies.movies.append(contentsOf: trendingMovies.movies)
            }).store(in: &disposables)
    }
    
    private func fetchPosterConfiguration() {
        if appContext.isPosterConfigurationAvailable { return }
        
        APIClient().posterConfiguration()
            .sink (receiveCompletion: { [weak self] completion in
                
                switch completion {
                case .finished:
                    appContext.isPosterConfigurationAvailable = true
                    self?.success = true
                case .failure(let error):
                    appContext.isPosterConfigurationAvailable = false
                    self?.error = error
                }
            }, receiveValue: { posterConfiguration in
                appContext.posterConfiguration = posterConfiguration
            }).store(in: &disposables)
    }
    
}

//
//  MovieDetailsViewModel.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Foundation
import Combine

class MovieDetailsViewModel: BaseViewModel, ObservableObject, Identifiable {
    
    // MARK: - Published Properties
    
    @Published var success: Bool = false
    @Published var error: APIError? = nil
    
    // MARK: -
    
    private var movie: Movie?
    private let movieID: Int
    private let apiService: APIService
    private var disposables: Set<AnyCancellable> = []
    
    // MARK: - Init
    
    init(apiService: APIService, movieID: Int, movie: Movie? = nil) {
        self.apiService = apiService
        self.movieID = movieID
        self.movie = movie
        fetchMovieDetails()
    }
    
    // MARK: - Public interfaces
    
    var title: String {
        guard let movie = movie else { return "" }
        return movie.name
    }
    
    var date: String {
        guard let movie = movie else { return "" }
        return FormatterHelper.getYear(from: movie.releaseDate)
    }
    
    var overview: String {
        guard let movie = movie else { return "" }
        return movie.overview
    }
    
    var image: String {
        guard let movie = movie else { return "" }
        return ImageUrlBuilder.getUrl(with: movie.posterPath)
    }
    
}

// MARK: - Networking

extension MovieDetailsViewModel {
    
    private func fetchMovieDetails() {
        apiService.movieDetails(id: movieID)
            .sink (receiveCompletion: { [weak self] completion in
                
                switch completion {
                case .finished:
                    self?.success = true
                case .failure(let error):
                    self?.error = error
                }
            }, receiveValue: { [weak self] movie in
                self?.movie = movie
            }).store(in: &disposables)
    }
}

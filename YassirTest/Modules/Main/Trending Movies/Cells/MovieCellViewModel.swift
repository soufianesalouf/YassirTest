//
//  MovieCellViewModel.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import Foundation

struct MovieCellViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    private var movie: Movie
    
    // MARK: - Init
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    // MARK: - Public Interfaces
    
    var name: String {
        movie.name
    }
    
    var releaseDate: String {
        String(movie.releaseDate.prefix(4))
    }
    
    var image: String {
        "imagePlaceholder"
    }
    
}

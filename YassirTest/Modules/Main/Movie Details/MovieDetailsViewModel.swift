//
//  MovieDetailsViewModel.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Foundation

class MovieDetailsViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    let movieID: Int
    
    // MARK: - Init
    
    init(movieID: Int) {
        self.movieID = movieID
    }
    
}

//
//  YassirTestTests.swift
//  YassirTestTests
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import XCTest
@testable import YassirTest

class YassirTestTests: XCTestCase {
    
    func testTrendingMoviesViewController() {
        _ = TrendingMoviesViewController.instantiate()
    }
    
    func testMovieDetailsViewController() {
        _ = MovieDetailsViewController.instantiate()
    }
    
    func testTrendingMoviesViewModel() {
        _ = TrendingMoviesViewModel(apiService: APIClient())
    }
    
    func testMovieDetailsViewModel() {
        _ = MovieDetailsViewModel(apiService: APIClient(), movieID: 15)
    }

}

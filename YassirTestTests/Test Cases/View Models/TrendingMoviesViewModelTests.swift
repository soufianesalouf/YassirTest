//
//  TrendingMoviesViewModelTests.swift
//  YassirTestTests
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import XCTest
@testable import YassirTest

class TrendingMoviesViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: TrendingMoviesViewModel!
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        // Load Stub
        let data = loadStubFromBundle(withName: "Movies", extension: "json")!
        let movie: TrendingMovies = try! JSONDecoder().decode(TrendingMovies.self, from: data)
        
        // Initialize View Model
        sut = TrendingMoviesViewModel(apiService: APIClient(), trendingMovies: movie)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Cases
    
    func testRowCount() {
        XCTAssertEqual(sut.rowsCount, 20)
    }
    
    func testgetMovieViewModel() {
        let movie = sut.getMovieViewModel(atIndex: 1)
        XCTAssertEqual(movie.name, "Minions: The Rise of Gru")
    }
    
    func testGetMovieID() {
        let movieID = sut.getMovieID(atIndex: 1)
        XCTAssertEqual(movieID, 438148)
    }
    
}

//
//  MovieDetailsViewModelTests.swift
//  YassirTestTests
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import XCTest
@testable import YassirTest

class MovieDetailsViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: MovieDetailsViewModel!
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        // Load Stub
        let data = loadStubFromBundle(withName: "MovieDetails", extension: "json")!
        let movie: Movie = try! JSONDecoder().decode(Movie.self, from: data)
        
        // Initialize View Model
        sut = MovieDetailsViewModel(apiService: APIClient(), movieID: 1, movie: movie)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Cases
    
    func testMovieDetailsViewModel() {
        XCTAssertEqual(sut.title, "Jurassic World Dominion")
        XCTAssertEqual(sut.date, "2022")
        XCTAssertEqual(sut.overview, "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history’s most fearsome creatures.")
        XCTAssertEqual(sut.image, "https://image.tmdb.org/t/p/w92/kAVRgw7GgK1CfYEJq8ME6EvRIgU.jpg")
    }
    
    func testDateFormating() {
        let date = "2025-09-23"
        let year = FormatterHelper.getYear(from: date)
        XCTAssertEqual(year, "2025")
    }
    
    func testImageUrlBuilder() {
        let posterPath = "/kAVRgw7GgK1CfYEJq8ME6EvRIgU.jpg"
        XCTAssertEqual(ImageUrlBuilder.getUrl(with: posterPath), "https://image.tmdb.org/t/p/w92/kAVRgw7GgK1CfYEJq8ME6EvRIgU.jpg")
    }
    
}

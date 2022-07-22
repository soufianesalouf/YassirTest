//
//  APIClientTests.swift
//  YassirTestTests
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import XCTest
import Combine
@testable import YassirTest

class APIClientTests: XCTestCase {
    
    // MARK: - Properties
    
    private let apiClient = APIClient()
    private var disposables: Set<AnyCancellable> = []

    // MARK: - Tests for online and offline cases
    
    func testMoviesOnline() throws {
        
        let expectation = self.expectation(description: "Fetch Movies")

        apiClient.movies()
            .sink { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure:
                    XCTFail("Request Should Succeed")
                }
            } receiveValue: { moviesList in
                XCTAssertEqual(moviesList.movies.count, 20)
            }.store(in: &disposables)
        
        waitForExpectations(timeout: 10.0)
    }
    
    func testMoviesOffOnline() throws {
        guard let data = loadStubFromBundle(withName: "Movies", extension: "json") else { return }
        let trendingMovies = try! JSONDecoder().decode(TrendingMovies.self, from: data)
        
        XCTAssertEqual(trendingMovies.movies.count, 20)
    }
    
    func testMovieDetailsOnline() throws {
        
        let expectation = self.expectation(description: "Fetch MOvie Details")

        apiClient.movieDetails(id: 507086)
            .sink { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure:
                    XCTFail("Request Should Succeed")
                }
            } receiveValue: { movie in
                XCTAssertEqual(movie.name, "Jurassic World Dominion")
            }.store(in: &disposables)
        
        waitForExpectations(timeout: 10.0)
    }
}

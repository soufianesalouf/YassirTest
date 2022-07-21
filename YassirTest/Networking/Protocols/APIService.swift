//
//  APIService.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Foundation
import Combine

protocol APIService {

    // MARK: - Properties

    func movies() -> AnyPublisher<TrendingMovies, APIError>
    func movieDetails(id: Int) -> AnyPublisher<Movie, APIError>

}

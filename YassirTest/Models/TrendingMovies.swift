//
//  TrendingMovies.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Foundation

struct TrendingMovies: BaseModel {
    
    // MARK: - Properties

    let page: Int
    let movies: [Movie]
    let totalPages: Int

    // MARK: - Coding Keys

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case movies = "results"
        case totalPages = "total_pages"
    }
    
}

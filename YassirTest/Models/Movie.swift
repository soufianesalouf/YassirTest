//
//  Movie.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Foundation

struct Movie: BaseModel {
    
    // MARK: - Properties
    
    let id: Int
    let name: String
    let releaseDate: String
    let posterPath: String
    let overview: String

    // MARK: - Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "original_title"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case overview = "overview"
    }
    
}

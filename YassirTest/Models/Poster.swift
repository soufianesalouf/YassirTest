//
//  Poster.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Foundation

struct Poster: BaseModel {
    
    // MARK: - Properties
    
    let baseURL: String
    let posterSizes: [String]

    // MARK: - Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case baseURL = "secure_base_url"
        case posterSizes = "poster_sizes"
    }
    
}

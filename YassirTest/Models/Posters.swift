//
//  Posters.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Foundation

struct Posters: BaseModel {
    
    // MARK: - Properties
    
    let images: Poster

    // MARK: - Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case images = "images"
    }
    
}

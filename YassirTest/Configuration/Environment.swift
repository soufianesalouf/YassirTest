//
//  Environment.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Foundation

enum Environment {
    
    static var apiBaseURL: URL {
        URL(string: "https://api.themoviedb.org/3/")!
    }
    
    static var apiKey: String {
        "c9856d0cb57c3f14bf75bdc6c063b8f3"
    }
    
}

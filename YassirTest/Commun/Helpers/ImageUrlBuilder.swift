//
//  ImageUrlBuilder.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import Foundation

struct ImageUrlBuilder {
    
    /// Returns the movie poster url
    /// - Parameter path: poster path
    /// - Returns: The full poster url
    static func getUrl(with path: String) -> String {
        guard let posterConfiguration = appContext.posterConfiguration,
              let posterSize = posterConfiguration.images.posterSizes.first else { return "" }
        
        return "\(posterConfiguration.images.baseURL)\(posterSize)\(path)"
    }
    
}

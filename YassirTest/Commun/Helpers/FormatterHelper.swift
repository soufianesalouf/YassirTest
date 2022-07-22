//
//  FormatterHelper.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import Foundation

struct FormatterHelper {
    
    /// Returns the movie poster url
    /// - Parameter date: date
    /// - Returns: The year
    static func getYear(from date: String) -> String {
        String(date.prefix(4))
    }
    
}

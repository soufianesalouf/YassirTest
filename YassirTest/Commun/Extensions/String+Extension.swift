//
//  String+Extension.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import Foundation

extension String {
    
    // MARK: - Computed properties
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}

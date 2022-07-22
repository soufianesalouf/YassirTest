//
//  i18n.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import Foundation

struct i18n {
    
    // MARK: - Private Init
    
    private init() {}
    
    // MARK: - Commun
    
    static var EmptyString: String { return "EmptyString".localized }
    
    // MARK: - Buttons
    
    static var okButton: String { return "button.ok".localized }
    
    // MARK: - Errors
    
    static var somethingHappenedError: String { return "error.somethingHappened".localized }
    
}

//
//  Constants.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import UIKit

// MARK: - App Context

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let appContext = appDelegate.appContext

// MARK: - User Defaults

enum UserDefaultsKeys {
    
    // MARK: - Cases
    
    case isPostersConfigurationAvailable
    case postersConfiguration
    
    // MARK: - Raw Values
    
    var rawValue: String {
        switch self {
        case .isPostersConfigurationAvailable:
            return "IS_POSTERS_CONFIGURATION_AVAILABLE"
        case .postersConfiguration:
            return "POSTERS_CONFIGURATION"
        }
    }
    
}

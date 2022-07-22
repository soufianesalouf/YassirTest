//
//  AppContext.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import Foundation

class AppContext {
    
    var isPosterConfigurationAvailable: Bool {
        get {
            return UserDefaults.standard.object(forKey: UserDefaultsKeys.isPostersConfigurationAvailable.rawValue) as? Bool ?? false
        }
        
        set {
            return UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.isPostersConfigurationAvailable.rawValue)
        }
    }
    
    var posterConfiguration: Posters? {
        get {
            return UserDefaults.standard.object(Posters.self, with: UserDefaultsKeys.postersConfiguration.rawValue)
        }
        
        set {
            UserDefaults.standard.set(object: newValue, forKey: UserDefaultsKeys.postersConfiguration.rawValue)
        }
    }
    
}

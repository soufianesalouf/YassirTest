//
//  BuildConfiguration.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import Foundation

class BuildConfiguration {
    
    // MARK: - Properties
    
    static let shared = BuildConfiguration()
    var environment: Environment

    // MARK: -
    
    private let configuration: Configuration
    
    
    // MARK: - Init
    
    init() {
        
        // Get current configuration
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as! String
        environment = Environment(rawValue: currentConfiguration)!
        
        // Setup accordantly to the environment
        switch environment {
        case .debugDev, .releaseDev:
            configuration = Configuration(fileName: "DEV")
        case .debugQA, .releaseQA:
            configuration = Configuration(fileName: "QA")
        case .debugProd, .releaseProd:
            configuration = Configuration(fileName: "PROD")
        }
    }
    
    // MARK: - Public interfaces
    
    var apiBaseURL: URL {
        URL(string: configuration.value(forKey: "apiBaseURL"))!
    }
    
    var apiKey: String {
        return configuration.value(forKey: "apiKey")
    }
    
}

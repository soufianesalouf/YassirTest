//
//  Configuration.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import Foundation

class Configuration {
    
    // MARK: - Properties
    
    private let fileName: String
    private let config: [String: Any]
    
    // MARK: - Init
    
    init(fileName: String) {
        
        self.fileName = fileName
        
        // Read configuration dictionary from plist
        let path = Bundle.main.path(forResource: fileName, ofType: "plist")
        self.config = NSDictionary(contentsOfFile: path!) as! [String: Any]
    }
    
    // MARK: - Public Interface
    
    func value<T>(forKey key: String) -> T {
        
        if let value = config[key] as? T {
            return value
        } else {
            fatalError("Value for key \(key) not found in \(fileName).plist")
        }
    }
    
}

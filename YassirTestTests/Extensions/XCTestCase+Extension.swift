//
//  XCTestCase+Extension.swift
//  YassirTestTests
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import XCTest

extension XCTestCase {
    
    func loadStubFromBundle(withName name: String, extension: String) -> Data? {
        let bundle = Bundle(for: classForCoder)
        guard let url = bundle.url(forResource: name, withExtension: `extension`) else { return nil }
        
        return try? Data(contentsOf: url)
    }
    
}

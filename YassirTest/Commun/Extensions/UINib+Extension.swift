//
//  UINib+Extension.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import UIKit

extension UINib {
    
    /// Load Nib with name
    ///
    /// - Parameter nibName: Nib name
    /// - Returns: UINib
    static func nib(named nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
}

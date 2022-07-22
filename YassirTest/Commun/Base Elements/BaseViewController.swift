//
//  BaseViewController.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import UIKit

class BaseViewController: UIViewController, Storyboardable {
    
    /// Show native alert
    ///
    /// - Parameters:
    ///   - title: Title
    ///   - message: Message
    ///   - defaultAction: Default action title
    func showAlert(title: String,
                   message: String,
                   defaultAction: String) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: defaultAction, style: .default))
        present(alert, animated: true)
    }
    
}

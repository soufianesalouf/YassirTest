//
//  MovieDetailsViewController.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import UIKit

class MovieDetailsViewController: BaseViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: MovieDetailsViewModel!
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Details for movie with id: \(viewModel.movieID)"
    }
    
}

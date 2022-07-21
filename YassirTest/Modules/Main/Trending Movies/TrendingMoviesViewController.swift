//
//  TrendingMoviesViewController.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import UIKit

class TrendingMoviesViewController: BaseViewController {
    
    // MARK: - Properties
    
    var viewModel: TrendingMoviesViewModel!
    var didShowMovie: ((Int) -> Void)?
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func movieDetailsPressed(_ sender: Any) {
        didShowMovie?(14)
    }
    
}


//
//  MovieDetailsViewController.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import UIKit
import Combine

class MovieDetailsViewController: BaseViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var posterImageView: LoadableImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: MovieDetailsViewModel!
    
    // MARK: -
    
    private var disposables: Set<AnyCancellable> = []
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }
    
    // MARK: - Local Helpers
    
    private func setupUI() {
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.date
        overviewLabel.text = viewModel.overview
        posterImageView.loadImageUsing(urlString: viewModel.image, completion: nil)
    }
    
    private func setupBinding() {
        viewModel.$success
            .sink{ [weak self] _ in
                self?.setupUI()
            }
            .store(in: &disposables)
        
        viewModel.$error
            .sink{ error in
                guard let error = error else { return }
                print("Error: \(error.localizedDescription)")
            }
            .store(in: &disposables)
    }
    
}

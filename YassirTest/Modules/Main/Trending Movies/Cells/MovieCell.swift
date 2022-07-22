//
//  MovieCell.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 22/7/2022.
//

import UIKit

class MovieCell: UITableViewCell {

    // MARK: - Type Properties
    
    static let identifier = "MovieCell"
    
    // MARK: - Views
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Configuration
    
    func configure(with viewModel: MovieCellViewModel) {
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.releaseDate
        movieImageView.image = UIImage(named: viewModel.image)
    }
    
}

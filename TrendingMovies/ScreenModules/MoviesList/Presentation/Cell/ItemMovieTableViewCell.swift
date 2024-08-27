//
//  ItemMovieTableViewCell.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import UIKit

class ItemMovieTableViewCell: UITableViewCell {

    // MARK: - Private properties

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        ContainerView.layer.cornerRadius = ViewValues.defaultCornerRadius
        ContainerView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

// MARK: - Extensions here
extension ItemMovieTableViewCell: Reusable {}

//
//  ItemMovieTableViewCell.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 26/8/2024.
//

import UIKit

class ItemMovieTableViewCell: UITableViewCell {

    // MARK: - Private properties
    @IBOutlet weak var ItemMovieImage: UIImageView!
    @IBOutlet weak var ItemMovieName: UILabel!
    @IBOutlet weak var ItemMovieYear: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

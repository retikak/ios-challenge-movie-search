//
//  MovieCustomTableViewCell.swift
//  MovieSearch
//
//  Created by Retika Kumar on 4/30/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updatWithMovie(movie:Movie) {
        titleLabel.text = movie.title
        ratingsLabel.text = String(movie.voteAverage)
        summaryLabel.text = movie.summary
        
        
        if let url = NSURL(string: movie.posterUrl) {
            if let data = NSData(contentsOfURL: url) {
                movieImage.image = UIImage(data: data)
            }        
        }
    }

}

//
//  BeerTableViewCell.swift
//  Crafty
//
//  Created by Justin Guedes on 04/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var rating: [UIImageView]!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func configure(with beer: Beer, and company: Company) {
        nameLabel.text = beer.name
        rating.enumerated().forEach { $1.isHidden = $0 >= beer.rating }
        originLabel.text = company.name
        descriptionLabel.text = beer.description
    }

}

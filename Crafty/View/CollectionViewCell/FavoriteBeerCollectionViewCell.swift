//
//  FavoriteBeerCollectionViewCell.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class FavoriteBeerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var beerLabel: UILabel!

    func configure(with name: String) {
        beerLabel.text = name
    }

}

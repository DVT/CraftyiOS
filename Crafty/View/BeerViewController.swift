//
//  BeerViewController.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class BeerViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!

    var user: User!
    var beer: Beer!
    var company: Company!

    func configure(with beer: Beer, and company: Company) {
        self.beer = beer
        self.company = company
        self.user = UserCenter.current
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = beer.name
        companyLabel.text = company.name
        descriptionLabel.text = beer.description
        updateButton()
    }

    func updateButton() {
        if user.favoriteBeer.contains(beer.id) {
            likeButton.setTitle("I Changed My Mind", for: .normal)
            likeButton.setTitleColor(.systemRed, for: .normal)
        } else {
            likeButton.setTitle("I Like This!", for: .normal)
            likeButton.setTitleColor(.link, for: .normal)
        }
    }

    @IBAction func likeButtonTapped(_ sender: Any) {
        var favoriteBeers = user.favoriteBeer
        if user.favoriteBeer.contains(beer.id) {
            favoriteBeers.removeAll(where: { $0 == beer.id })
        } else {
            favoriteBeers.append(beer.id)
        }

        let updateUser = User(username: user.username,
                              password: user.password,
                              favoriteBeer: favoriteBeers)
        UserCenter.save(user: updateUser)
        user = updateUser
        updateButton()
    }
}

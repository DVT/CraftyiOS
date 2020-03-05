//
//  InfoViewController.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    var actionButtonCallback: (() -> Void)?

    var info: Info!

    func configure(with info: Info) {
        self.info = info
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = info.title
        subtitleLabel.text = info.subtitle
        subtitleLabel.isHidden = info.subtitle == nil
        imageView.image = info.imageName.flatMap(UIImage.init(named:))
        imageView.isHidden = info.imageName == nil
        descriptionLabel.text = info.description
        descriptionLabel.isHidden = info.description == nil
        actionButton.setTitle(info.actionTitle, for: .normal)
        actionButton.isHidden = info.actionTitle == nil
        actionButtonCallback = info.actionCallback
    }

    @IBAction func actionButtonTapped(_ sender: Any) {
        actionButtonCallback?()
    }

}

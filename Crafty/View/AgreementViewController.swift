//
//  AgreementViewController.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class AgreementViewController: UIViewController {

    var username: String!
    var password: String!

    @IBAction func agreeButtonTapped(_ sender: Any) {
        UserCenter.create(username: username, password: password)
        navigationController?.loadAndPushViewController(UIStoryboard.homeViewController)
    }

    @IBAction func disagreeButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "We'll wait til you agree!",
                                                message: "Unfortunately you have no choice.",
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Cheers!",
                                     style: .default,
                                     handler: nil)
        alertController.addAction(okAction)
        navigationController?.present(alertController, animated: true, completion: nil)
    }

}

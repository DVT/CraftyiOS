//
//  UINavigationController.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

extension UINavigationController {

    func loadAndPushViewController(_ viewController: UIViewController, afterDelay delay: Double = Environment.delay) {
        let loadingViewController = UIStoryboard.loadingViewController
        loadingViewController.setDestination(viewController, afterDelay: delay)
        pushViewController(loadingViewController, animated: true)
    }

    func presentAlert(title: String, message: String, button: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: button,
                                     style: .default,
                                     handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

}

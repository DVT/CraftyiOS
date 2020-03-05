//
//  UIStoryboard.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

extension UIStoryboard {

    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: .main)
    }

    static var loadingViewController: LoadingViewController {
        return instantiateViewController(for: "loader")
    }

    static var loginViewController: LoginViewController {
        return instantiateViewController(for: "login")
    }

    static var agreementViewController: AgreementViewController {
        return instantiateViewController(for: "agreement")
    }

    static var homeViewController: UIViewController {
        return instantiateViewController(for: "home")
    }

    static var beerViewController: BeerViewController {
        return instantiateViewController(for: "beer")
    }

    static var infoViewController: InfoViewController {
        return instantiateViewController(for: "info")
    }

    private static func instantiateViewController<T: UIViewController>(for identifier: String) -> T {
        let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: identifier)
        guard let instance = viewController as? T else {
            fatalError("Could not find \(String(describing: T.self))!")
        }

        return instance
    }

}

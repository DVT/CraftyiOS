//
//  Environment.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

public struct Environment {

    public static var delay: Double {
        guard let delayString = UserDefaults.standard.string(forKey: "delay"),
            let delay = Double(delayString) else {
                return Double(arc4random_uniform(4) + 1)
        }

        return delay
    }

}

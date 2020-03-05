//
//  User.swift
//  Crafty
//
//  Created by Justin Guedes on 04/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

struct User: Codable {
    let username: String
    let password: String

    let favoriteBeer: [String]
}

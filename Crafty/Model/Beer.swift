//
//  Beer.swift
//  Crafty
//
//  Created by Justin Guedes on 04/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

struct Beer: Codable {
    let id: String
    let name: String
    let companyId: String
    let description: String
    let rating: Int
}

//
//  BeerLibrary.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

let beerLibrary = BeerLibrary.stored

struct BeerLibrary: Codable {
    let beers: [Beer]
    let companies: [Company]
    let href: String
}

extension BeerLibrary {

    static var stored: BeerLibrary {
        guard let jsonUrl = Bundle.main.url(forResource: "beerLibrary", withExtension: "json"),
            let data = try? Data(contentsOf: jsonUrl),
            let library = try? JSONDecoder().decode(BeerLibrary.self, from: data) else {
                fatalError("Could not load beerLibrary.json")
        }

        return library
    }

}

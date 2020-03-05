//
//  Fact.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

let facts = Fact.stored

struct Fact: Codable {
    let top: String
    let bottom: String
}

extension Fact {

    static var stored: [Fact] {
        guard let jsonUrl = Bundle.main.url(forResource: "loadingFacts", withExtension: "json"),
            let data = try? Data(contentsOf: jsonUrl),
            let facts = try? JSONDecoder().decode([Fact].self, from: data) else {
                fatalError("Could not load loadingFacts.json")
        }

        return facts
    }

}

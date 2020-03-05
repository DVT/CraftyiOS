//
//  BeerElementQuery.swift
//  CraftyUITests
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest

struct BeerElementQuery {

    enum Beer: String {
        case triggerfishTitan = "Triggerfish Titan"
        case copperlakeIPA = "Copperlake IPA"
    }

    let element: XCUIElementQuery

    subscript(_ name: Beer) -> XCUIElement {
        return self[name.rawValue]
    }

    subscript(_ name: String) -> XCUIElement {
        return element[name]
    }

}

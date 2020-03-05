//
//  SecondScenario.swift
//  CraftyUITests
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest

class SecondScenario: TestCase {

    /// Create a test that signs in the user, selects the "Search" tab bar button,
    /// swipes up to the "Copperlake IPA" beer, taps the item, taps the "I Like
    /// This!" button, swipes down the view, and selects the "My Beer" tab bar
    /// button to check if the "Copperlake IPA" exists
    func testUserCanFavoriteCopperlakeIPABeer() {
        // First we set up the environment (the login details)
        environment.setUpWith(username: "user", password: "password")

        // Next we launch the application, this needs to happen after
        // setting up the environment, so the launch arguments can take
        // effect.
        application.launch()

        // INSERT HERE

        // Assert that we can see the "Copperlake IPA" beer
        XCTAssert(application.beer[.copperlakeIPA].exists)
    }

    /// Create a test that signs in the user, selects the "Search" tab bar button,
    /// taps the "Triggerfish Titan" beer, taps the "I Changed My Mind" button,
    /// swipes down the view, and selects the "My Beer" tab bar button to check
    /// if the "Triggerfish Titan" exists
    func testUserCanUnFavoriteCopperlakeIPABeer() {
        // First we set up the environment (the login details, triggerfish titan
        // beer)
        environment.setUpWith(username: "user", password: "password", favoriteBeer: "3")

        // Next we launch the application, this needs to happen after
        // setting up the environment, so the launch arguments can take
        // effect.
        application.launch()

        // INSERT HERE

        XCTAssert(application.beer[.triggerfishTitan].exists)

        // INSERT MORE HERE

        // Assert that we can see the "Triggerfish Titan" beer
        XCTAssertFalse(application.beer[.triggerfishTitan].exists)
    }

}

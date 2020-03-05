//
//  FirstScenario.swift
//  CraftyUITests
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest

class FirstScenario: TestCase {

    /// Create a test that will log the user in with the provided credentials and
    /// show the "My Beer" tab bar button
    func testUserCanSignIn() {
        // First we set up the environment (the login details)
        environment.setUpWith(username: "user", password: "password")

        // Next we launch the application, this needs to happen after
        // setting up the environment, so the launch arguments can take
        // effect.
        application.launch()

        // INSERT HERE

        // Assert that we can see the "My Beer" tab bar below
        XCTAssert(application.myBeerTabBarButton.exists)
    }

    /// Create a test that will enter the incorrect login details and display an alert
    func testUserGetsPresentedAnAlertWhenEnteringIncorrectLoginDetails() {
        // First we set up the environment (the login details)
        environment.setUpWith(username: "user", password: "password")

        // Next we launch the application, this needs to happen after
        // setting up the environment, so the launch arguments can take
        // effect.
        application.launch()

        // INSERT HERE

        // Assert that we can see the "Wrong" alert show up
        XCTAssert(application.wrongAlert.exists)
    }

    /// Create a test that will sign up the user and show the "My Beer" tab bar button
    func testUserCanSignsUp() {
        // First we set up the environment
        environment.setUpWithNoUser()

        // Next we launch the application, this needs to happen after
        // setting up the environment, so the launch arguments can take
        // effect.
        application.launch()

        // INSERT HERE

        // Assert that we can see the "My Beer" tab bar below
        XCTAssert(application.myBeerTabBarButton.exists)
    }

}

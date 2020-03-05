//
//  FirstScenarioSolution.swift
//  CraftyUITests
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest

class FirstScenarioSolution: TestCase {

    /// Create a test that will log the user in with the provided credentials and
    /// show the "My Beer" tab bar button
    func testUserCanSignIn() {
        // First we set up the environment (the login details)
        environment.setUpWith(username: "user", password: "password")

        // Next we launch the application, this needs to happen after
        // setting up the environment, so the launch arguments can take
        // effect.
        application.launch()

        // Tap on the username text field to present the keyboard
        application.usernameTextField.tap()

        // Tap the "user" keys on the keyboard
        application.tapKeys(text: "user")

        // Tap on the password text field to change focus of the keyboard
        application.passwordTextField.tap()

        // Tap the "password" keys on the keyboard
        application.tapKeys(text: "password")

        // Tap "Go Drink!" button to login
        application.goDrinkButton.tap()

        // Add delay to ensure we have enough time to display the "My Beer" tab
        sleep(1)

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

        // Tap on the username text field to present the keyboard
        application.usernameTextField.tap()

        // Tap the "user" keys on the keyboard
        application.tapKeys(text: "user")

        // Tap on the password text field to change focus of the keyboard
        application.passwordTextField.tap()

        // Tap the "pass" keys on the keyboard
        application.tapKeys(text: "pass")

        // Tap "Go Drink!" button to login
        application.goDrinkButton.tap()

        // Optional: Add delay to ensure we have enough time to display the alert
        sleep(1)

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

        // Tap on the username text field to present the keyboard
        application.usernameTextField.tap()

        // Tap the "user" keys on the keyboard
        application.tapKeys(text: "user")

        // Tap on the password text field to change focus of the keyboard
        application.passwordTextField.tap()

        // Tap the "password" keys on the keyboard
        application.tapKeys(text: "password")

        // Tap on the confirm password text field to change focus of the
        // keyboard
        application.confirmPasswordTextField.tap()

        // Tap the "password" keys on the keyboard
        application.tapKeys(text: "password")

        // Tap "I Want A Drink!" button to sign up
        application.iWantADrinkButton.tap()

        // Add delay to ensure we have enough time to display the "Agreement"
        // screen
        sleep(1)

        // Tap "I Agree!" button
        application.iAgreeButton.tap()

        // Add delay to ensure we have enough time to display the "My Beer" tab
        sleep(1)
        
        // Assert that we can see the "My Beer" tab bar below
        XCTAssert(application.myBeerTabBarButton.exists)
    }

}

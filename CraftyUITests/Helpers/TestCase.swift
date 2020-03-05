//
//  TestCase.swift
//  CraftyUITests
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest

class TestCase: XCTestCase {

    var application: XCUIApplication!
    var environment: TestEnvironment!

    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        application = XCUIApplication()
        environment = TestEnvironment(application: application)
    }

    func signInUser() {
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
    }

    func signUpUser() {
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
    }

}

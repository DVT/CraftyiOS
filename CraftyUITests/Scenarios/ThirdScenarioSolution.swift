//
//  ThirdScenarioSolution.swift
//  CraftyUITests
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest

class ThirdScenarioSolution: TestCase {

    /// Create a test that can share the beer application on the last
    /// page of the "About" tab.
    func testUserSharesTheApp() {
        // First we set up the environment (the login details)
        environment.setUpWith(username: "user", password: "password")

        // Next we launch the application, this needs to happen after
        // setting up the environment, so the launch arguments can take
        // effect.
        application.launch()

        // Sign in the user
        signInUser()

        // Tap the "About" tab bar button
        application.aboutTabBarButton.tap()

        // Swipe left to the second page
        application.swipeLeft()

        // Swipe left to the last page
        application.swipeLeft()

        // Tap the "Share" button
        application.shareButton.tap()

        // Assert that the share alert is showing
        XCTAssert(application.thanksForSharingAlert.exists)
    }

    /// Create a test that signs up the user, then deletes the profile
    func testUserSignsUpAndDeletesProfile() {
        // First we set up the environment
        environment.setUpWithNoUser()

        // Next we launch the application, this needs to happen after
        // setting up the environment, so the launch arguments can take
        // effect.
        application.launch()

        // Sign up the user
        signUpUser()

        // Tap the "Delete Profile" button
        application.deleteProfileButton.tap()

        // Add delay to ensure the login screen is showing
        sleep(1)

        // Assert that the "I Want A Drink Button" is showing
        // which means that the user profile has been deleted
        XCTAssert(application.iWantADrinkButton.exists)
    }

}

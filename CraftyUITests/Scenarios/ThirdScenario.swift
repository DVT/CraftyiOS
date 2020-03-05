//
//  ThirdScenario.swift
//  CraftyUITests
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest

class ThirdScenario: TestCase {

    /// Create a test that can share the beer application on the last
    /// page of the "About" tab.
    func testUserSharesTheApp() {
        // INSERT HERE

        // Assert that the share alert is showing
        XCTAssert(application.thanksForSharingAlert.exists)
    }

    /// Create a test that signs up the user, then deletes the profile
    func testUserSignsUpAndDeletesProfile() {
        // INSERT HERE

        // Assert that the "I Want A Drink Button" is showing
        // which means that the user profile has been deleted
        XCTAssert(application.iWantADrinkButton.exists)
    }

}

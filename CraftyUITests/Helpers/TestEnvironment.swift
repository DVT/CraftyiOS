//
//  TestEnvironment.swift
//  CraftyUITests
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation
import XCTest

@testable import Crafty

struct TestEnvironment {

    let application: XCUIApplication

    init(application: XCUIApplication) {
        self.application = application
        self.application.launchArguments += ["-delay", "0"]
    }

    func setUpWithNoUser() {
        application.launchArguments += ["-initial.user.name", ""]
        application.launchArguments += ["-initial.user.password", ""]
        application.launchArguments += ["-initial.user.favoriteBeer", ""]
    }

    func setUpWith(username: String, password: String, favoriteBeer: String = "") {
        application.launchArguments += ["-initial.user.name", username]
        application.launchArguments += ["-initial.user.password", password]
        application.launchArguments += ["-initial.user.favoriteBeer", favoriteBeer]
    }

}

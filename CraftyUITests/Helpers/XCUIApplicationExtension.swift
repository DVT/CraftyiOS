//
//  XCUIApplicationExtension.swift
//  CraftyUITests
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import XCTest

// MARK - Keyboard Related
extension XCUIApplication {

    func tapA() { keys["a"].tap() }
    func tapB() { keys["b"].tap() }
    func tapC() { keys["c"].tap() }
    func tapD() { keys["d"].tap() }
    func tapE() { keys["e"].tap() }
    func tapF() { keys["f"].tap() }
    func tapG() { keys["g"].tap() }
    func tapH() { keys["h"].tap() }
    func tapI() { keys["i"].tap() }
    func tapJ() { keys["j"].tap() }
    func tapK() { keys["k"].tap() }
    func tapL() { keys["l"].tap() }
    func tapM() { keys["m"].tap() }
    func tapN() { keys["n"].tap() }
    func tapO() { keys["o"].tap() }
    func tapP() { keys["p"].tap() }
    func tapQ() { keys["q"].tap() }
    func tapR() { keys["r"].tap() }
    func tapS() { keys["s"].tap() }
    func tapT() { keys["t"].tap() }
    func tapU() { keys["u"].tap() }
    func tapV() { keys["v"].tap() }
    func tapW() { keys["w"].tap() }
    func tapX() { keys["x"].tap() }
    func tapY() { keys["y"].tap() }
    func tapZ() { keys["z"].tap() }

    func tapKeys(text: String) {
        for character in text {
            switch character {
            case "a": tapA()
            case "b": tapB()
            case "c": tapC()
            case "d": tapD()
            case "e": tapE()
            case "f": tapF()
            case "g": tapG()
            case "h": tapH()
            case "i": tapI()
            case "j": tapJ()
            case "k": tapK()
            case "l": tapL()
            case "m": tapM()
            case "n": tapN()
            case "o": tapO()
            case "p": tapP()
            case "q": tapQ()
            case "r": tapR()
            case "s": tapS()
            case "t": tapT()
            case "u": tapU()
            case "v": tapV()
            case "w": tapW()
            case "x": tapX()
            case "y": tapY()
            case "z": tapZ()
            default: XCTFail("Unknown Character")
            }
        }
    }

}

// MARK - TextField Related
extension XCUIApplication {

    var usernameTextField: XCUIElement {
        return textFields["Username"]
    }

    var passwordTextField: XCUIElement {
        return secureTextFields["Password"]
    }

    var confirmPasswordTextField: XCUIElement {
        return secureTextFields["Confirm Password"]
    }

}

// MARK - Button Related
extension XCUIApplication {

    var loginButton: XCUIElement {
        return buttons["Login"]
    }

    var signUpButton: XCUIElement {
        return buttons["Sign Up"]
    }

    var goDrinkButton: XCUIElement {
        return buttons["Go Drink!"]
    }

    var iWantADrinkButton: XCUIElement {
        return buttons["I want to Drink!"]
    }

    var iAgreeButton: XCUIElement {
        return buttons["I Agree!"]
    }

    var holdMyBeerButton: XCUIElement {
        return buttons["Hold My Beer"]
    }

    var signOutButton: XCUIElement {
        return buttons["Sign Out"]
    }

    var deleteProfileButton: XCUIElement {
        return buttons["Delete Profile"]
    }

    var iLikeThisButton: XCUIElement {
        return buttons["I Like This!"]
    }

    var iChangedMyMindButton: XCUIElement {
        return buttons["I Changed My Mind"]
    }

    var shareButton: XCUIElement {
        return buttons["Share"]
    }

}

// MARK - Tab Bar Related
extension XCUIApplication {

    var myBeerTabBarButton: XCUIElement {
        return tabBars.buttons["My Beer"]
    }

    var searchTabBarButton: XCUIElement {
        return tabBars.buttons["Search"]
    }

    var aboutTabBarButton: XCUIElement {
        return tabBars.buttons["About"]
    }

}

// MARK - Alert Related
extension XCUIApplication {

    var wrongAlert: XCUIElement {
        return alerts["Wrong"]
    }

    var somethingIsWrongAlert: XCUIElement {
        return alerts["Something Is Wrong!"]
    }

    var okAlertButton: XCUIElement {
        return alerts.buttons["Ok"]
    }

    var wellWaitTilYouAgreeAlert: XCUIElement {
        return alerts["We'll wait til you agree!"]
    }

    var thanksForSharingAlert: XCUIElement {
        return alerts["Thanks for Sharing!"]
    }

    var cheersAlertButton: XCUIElement {
        return alerts.buttons["Cheers!"]
    }

}

// MARK - Static Text Related
extension XCUIApplication {

    var beer: BeerElementQuery {
        return BeerElementQuery(element: staticTexts)
    }

}

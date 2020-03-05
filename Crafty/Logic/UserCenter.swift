//
//  UserCenter.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

class UserCenter {

    static var initialUser: User? {
        guard let username = UserDefaults.standard.string(forKey: "initial.user.name"),
            let password = UserDefaults.standard.string(forKey: "initial.user.password") else {
            return nil
        }

        guard !username.isEmpty, !password.isEmpty else {
            clearUser()
            return nil
        }

        let favoriteBeer = UserDefaults.standard.string(forKey: "initial.user.favoriteBeer") ?? ""
        return User(username: username, password: password, favoriteBeer: favoriteBeer.split(separator: ",").map { String($0) })
    }

    static var current: User? {
        guard let username = UserDefaults.standard.string(forKey: "user.name"), !username.isEmpty,
            let password = UserDefaults.standard.string(forKey: "user.password"), !password.isEmpty else {
            return nil
        }

        let favoriteBeer = UserDefaults.standard.string(forKey: "user.favoriteBeer") ?? ""
        return User(username: username, password: password, favoriteBeer: favoriteBeer.split(separator: ",").map { String($0) })
    }

    static func save(user: User) {
        UserDefaults.standard.set(user.username, forKey: "user.name")
        UserDefaults.standard.set(user.password, forKey: "user.password")
        UserDefaults.standard.set(user.favoriteBeer.joined(separator: ","), forKey: "user.favoriteBeer")
        UserDefaults.standard.synchronize()
    }

    static func clearUser() {
        UserDefaults.standard.removeObject(forKey: "user.name")
        UserDefaults.standard.removeObject(forKey: "user.password")
        UserDefaults.standard.removeObject(forKey: "user.favoriteBeer")
        UserDefaults.standard.synchronize()
    }

    @discardableResult
    static func create(username: String, password: String) -> User {
        let user = User(username: username, password: password, favoriteBeer: [])
        save(user: user)
        return user
    }

}

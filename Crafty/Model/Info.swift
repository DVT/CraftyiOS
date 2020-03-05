//
//  Info.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation

struct Info {
    let title: String
    let subtitle: String?
    let imageName: String?
    let description: String?
    let actionTitle: String?
    let actionCallback: (() -> Void)?
}

extension Info {

    init(title: String,
         subtitle: String? = nil,
         imageName: String? = nil,
         description: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.description = description
        self.actionTitle = nil
        self.actionCallback = nil
    }

}

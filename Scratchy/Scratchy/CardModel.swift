//
//  Item.swift
//  Scratchy
//
//  Created by Marek Polak on 25/03/2024.
//

import Foundation
import SwiftData

@Model
final class CardModel {
    var cardId: String
    var version: Double?

    init(cardId: String, version: Double? = nil) {
        self.cardId = cardId
        self.version = version
    }
}

extension CardModel {
    var activated: Bool {
        if let version {
            version > 6.1
        } else {
            false
        }
    }
}

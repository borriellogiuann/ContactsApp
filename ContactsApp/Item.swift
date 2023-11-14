//
//  Item.swift
//  ContactsApp
//
//  Created by Giovanni Borriello on 14/11/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

//
//  Item.swift
//  ContactsApp
//
//  Created by Giovanni Borriello on 14/11/23.
//

import Foundation
import SwiftData

@Model
final class Contact {
    var name: String
    
    init(name: String) {
        self.name = ""
    }
}

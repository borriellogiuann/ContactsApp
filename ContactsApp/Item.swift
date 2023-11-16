//
//  Item.swift
//  ContactsApp
//
//  Created by Giovanni Borriello on 14/11/23.
//

import Foundation
import SwiftData

@Model
final class Contact: Identifiable {
    var id: String
    var firstName: String
    
    init(firstName: String) {
        
        self.id = UUID().uuidString
        self.firstName = ""
    }
}

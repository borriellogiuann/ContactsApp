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
    var lastName: String
    var company: String
    var telephone: String
    
    init(firstName: String, lastName: String, company: String, telephone: String) {
        
        self.id = UUID().uuidString
        self.firstName = ""
        self.lastName = ""
        self.company = ""
        self.telephone = ""
    }
}

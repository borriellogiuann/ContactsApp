//
//  ContactView.swift
//  ContactsApp
//
//  Created by Giovanni Borriello on 17/11/23.
//

import SwiftUI
import SwiftData

struct ContactView: View {
    
    @Environment(\.modelContext) private var modelContext
    var contact: Contact
    var body: some View {
        Text("\(contact.firstName)\(" ")\(contact.lastName)").bold()
        Text("\(contact.telephone)")
    }
}

//#Preview {
//    ContactView()
//}

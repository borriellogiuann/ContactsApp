//
//  ContactsAppApp.swift
//  ContactsApp
//
//  Created by Giovanni Borriello on 14/11/23.
//

import SwiftUI
import SwiftData

@main
struct ContactsAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Contact.self)
                .environment(\.accessibilityEnabled, true)
        }
    }
}

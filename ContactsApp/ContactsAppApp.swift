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
    @State private var selection = 0
    var body: some Scene {
        WindowGroup {
            TabView (selection: $selection) {
                ContentView()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Favourites")
                    }
                ContentView()
                    .tabItem {
                        Image(systemName: "clock.fill")
                        Text("Recents")
                    }
                ContentView()
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Contacts")
                    }
                    .tag(0)
                ContentView()
                    .tabItem {
                        Image(systemName: "circle.grid.3x3")
                        Text("Keypad")
                    }
                ContentView()
                    .tabItem {
                        Image(systemName: "recordingtape")
                        Text("Voicemail")
                    }
            }
            .modelContainer(for: Contact.self)
        }
    }
}

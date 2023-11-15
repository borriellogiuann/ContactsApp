//
//  ContentView.swift
//  ContactsApp
//
//  Created by Giovanni Borriello on 14/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var searchBar = ""
    @Query private var contacts: [Contact]
    @State private var isModalPresented = false

    var filteredContacts: [Contact] {
        guard searchBar.isEmpty else { return contacts }
        return contacts.filter {$0.name.localizedCaseInsensitiveContains(searchBar)}
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    NavigationLink {
                        Text("Item at \(contact.name)")
                    } label: {
                        Text(contact.name)
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        isModalPresented.toggle()
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }.sheet(isPresented: $isModalPresented) {
                        ModalView(isPresented: $isModalPresented)
                    }
                }
            }
            .navigationTitle("Contacts")
            .searchable(text: $searchBar, prompt: "Search")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Contact.self, inMemory: true)
}

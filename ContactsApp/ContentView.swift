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
    
    @Query private var contacts: [Contact]
    
    @State private var searchBar = ""
    @State private var isModalPresented = false
    
    var filteredContacts: [Contact] {
        guard !searchBar.isEmpty else {
            return contacts
        }
        return contacts.filter {
            $0.firstName.localizedCaseInsensitiveContains(searchBar) || $0.lastName.localizedCaseInsensitiveContains(searchBar)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(filteredContacts) { contact in
                        NavigationLink(destination: ContactView(contact: contact)) {
                            Text("\(contact.firstName) \(contact.lastName)")
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                } header: {
                    HStack {
                        Image("Image")
                            .resizable()
                            .frame(width: 60.0, height: 60.0)
                            .background(CustomColor.Gray3)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text("Giovanni Borriello")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .bold()
                            Text("My Card")
                                .fontWeight(.regular)
                                .font(.callout)
                                .multilineTextAlignment(.leading)
                        }
                        .padding()
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        isModalPresented.toggle()
                    }) {
                        Label("Add Contact", systemImage: "plus")
                    }.sheet(isPresented: $isModalPresented) {
                        ModalView(isPresented: $isModalPresented)
                    }
                }
            }.searchable(text: $searchBar, prompt: "Search")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Contact.self, inMemory: true)
}

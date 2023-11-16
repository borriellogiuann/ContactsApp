//
//  ModalView.swift
//  ContactsApp
//
//  Created by Giovanni Borriello on 15/11/23.
//

import SwiftUI
import SwiftData

struct ModalView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Binding var isPresented: Bool
    
    @Query private var contacts: [Contact]
    
    @State private var firstName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("First Name", text: $firstName)
                }
            }
            .navigationBarTitle("New Contact", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Done") {
                    isPresented = false
                    addContact()
                })
        }
    }
    
    func addContact() {
        let item = Contact(firstName: firstName)
        item.firstName = firstName
        modelContext.insert(item)
    }
}

#Preview {
    ContentView()
}

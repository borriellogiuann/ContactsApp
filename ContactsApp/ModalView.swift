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
    @State private var lastName = ""
    @State private var company = ""
    @State private var telephone = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Company", text: $company)
                    TextField("Telephone", text: $telephone)
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
        let item = Contact(firstName: firstName, lastName: lastName, company: company, telephone: telephone)
        item.firstName = firstName
        item.lastName = lastName
        item.company = company
        item.telephone = telephone
        modelContext.insert(item)
    }
}

#Preview {
    ContentView()
}

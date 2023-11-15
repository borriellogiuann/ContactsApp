//
//  ModalView.swift
//  ContactsApp
//
//  Created by Giovanni Borriello on 15/11/23.
//

import SwiftUI

struct ModalView: View {
    @Binding var isPresented: Bool
    @State private var newName = ""
    @State private var newPhoneNumber = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $newName)
                    TextField("Phone Number", text: $newPhoneNumber)
                }
            }
            .navigationBarTitle("New Contact", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Dismiss") {
                    isPresented = false
                },
                trailing: Button("Done") {
                    isPresented = false
                }
            )
        }
    }
}

#Preview {
    ContentView()
}

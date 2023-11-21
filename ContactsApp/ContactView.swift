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
    
    @State private var isPresentingConfirm: Bool = false
    
    var contact: Contact
    
    var body: some View {
        VStack() {
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            Text("\(contact.firstName) \(contact.lastName)")
                .font(.title)
        }
        
        HStack {
            ZStack {
                Rectangle()
                    .cornerRadius(5)
                    .foregroundColor(.gray)
                VStack {
                    Image(systemName: "message.fill")
                    Button("message") {}
                }.padding(5)
            }.frame(width: 90, height: 60)
                .foregroundStyle(Color.white)
            ZStack {
                Rectangle()
                    .cornerRadius(5)
                    .foregroundColor(.gray)
                VStack {
                    Image(systemName: "phone.fill")
                    Button("call") {}
                }.padding(5)
            }.frame(width: 90, height: 60)
                .foregroundStyle(Color.white)
            ZStack {
                Rectangle()
                    .cornerRadius(5)
                    .foregroundColor(.gray)
                VStack {
                    Image(systemName: "video.fill")
                    Button("video") {}
                }.padding(5)
            }.frame(width: 90, height: 60)
                .foregroundStyle(Color.white)
            ZStack {
                Rectangle()
                    .cornerRadius(5)
                    .foregroundColor(.gray)
                VStack {
                    Image(systemName: "envelope.fill")
                    Button("mail") {}
                }.padding(5)
            }.frame(width: 90, height: 60)
                .foregroundStyle(Color.white)
        }
        Spacer()
        
        List{
            Section{
                HStack{
                    Image(systemName: "person.fill")
                    Text("Contact Photo & Poster")}}
            Section{
                VStack{
                    Text("Personalized")
                    Text(contact.telephone)}}
            Section{
                HStack {
                    Text("Facetime")
                    Spacer()
                    Image(systemName: "video.fill")
                    Image(systemName: "phone.fill")
                }
            }
            Section {
                Text("Notes")
            }
            Section {
                Button("Send Message"){}
                Button("Share Contact"){}
                Button("Add to Favourites"){}
            }
            Section {
                Button("Add to Emergency Contacts"){}
            }
            Section {
                Button("Share My Location"){}
            }
            Button ("Delete Contact", role: .destructive){
                isPresentingConfirm = true
            }.confirmationDialog("Are you sure?",
                                 isPresented: $isPresentingConfirm) {
                Button("Delete Contact", role: .destructive) {
                    modelContext.delete(contact)
                }
            }
        }
    }
}

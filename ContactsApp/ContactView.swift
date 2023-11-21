//
//  ContactView.swift
//  ContactsApp
//
//  Created by Giovanni Borriello on 17/11/23.
//

import SwiftUI
import SwiftData

struct CustomColor {
    static let Gray1 = Color("gray1")
    static let Gray2 = Color("gray2")
    static let Gray3 = Color("gray3")
}
struct ContactView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var isPresentingConfirm: Bool = false
    
    var contact: Contact
    
    var body: some View {
        ZStack {
            CustomColor.Gray2
                .ignoresSafeArea()
            VStack() {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                Text("\(contact.firstName) \(contact.lastName)")
                    .font(.largeTitle)
                HStack {
                    ZStack {
                        Rectangle()
                            .cornerRadius(5)
                            .foregroundColor(CustomColor.Gray1)
                        VStack {
                            Image(systemName: "message.fill")
                            Button("message") {}
                        }.padding(5)
                    }.frame(width: 83, height: 60)
                        .foregroundStyle(Color.white)
                    ZStack {
                        Rectangle()
                            .cornerRadius(5)
                            .foregroundColor(CustomColor.Gray1)
                        VStack {
                            Image(systemName: "phone.fill")
                            Button("call") {}
                        }.padding(5)
                    }.frame(width: 83, height: 60)
                        .foregroundStyle(Color.white)
                    ZStack {
                        Rectangle()
                            .cornerRadius(5)
                            .foregroundColor(CustomColor.Gray1)
                        VStack {
                            Image(systemName: "video.fill")
                            Button("video") {}
                        }.padding(5)
                    }.frame(width: 83, height: 60)
                        .foregroundStyle(Color.white)
                    ZStack {
                        Rectangle()
                            .cornerRadius(5)
                            .foregroundColor(CustomColor.Gray1)
                        VStack {
                            Image(systemName: "envelope.fill")
                            Button("mail") {}
                        }.padding(5)
                    }.frame(width: 83, height: 60)
                        .foregroundStyle(Color.white)
                }
            }
        }
        Spacer()
        
        List{
            Section {
                HStack {
                    Image(systemName: "person.fill")
                        .padding(.leading, 5)
                        .frame(width: 10, height: 10)
                    Text("Contact Photo & Poster")
                        .padding(.leading, 5)
                }
            }
            Section {
                VStack {
                    Text("Personalized")
                    Button(contact.telephone){}
                }
            }
            Section {
                HStack {
                    Text("Facetime")
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundColor(CustomColor.Gray3)
                            .frame(width: 35, height: 35)
                        Image(systemName: "video.fill")
                            .foregroundColor(.blue)
                    }
                    ZStack {
                        Circle()
                            .foregroundColor(CustomColor.Gray3)
                            .frame(width: 35, height: 35)
                        Image(systemName: "phone.fill")
                            .foregroundColor(.blue)
                    }
                }.padding(.top, 4)
                    .padding(.bottom, 4)
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

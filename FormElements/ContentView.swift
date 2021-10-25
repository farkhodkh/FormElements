//
//  ContentView.swift
//  FormElements
//
//  Created by Farkhod on 24.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var birthday = Date()
    @State private var shouldSendNews = false
    @State private var numberOfLikes = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal information")) {
                    TextField("First name", text: $firstName)
                    TextField("Last name", text: $lastName)
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                }
                
                Section(header: Text("Actions")) {
                    Toggle("Send News", isOn: $shouldSendNews)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number of Likes", value: $numberOfLikes, in: 1...100)
                    Text("This video has \(numberOfLikes) likes")
                    Link("Privacy policy", destination: URL(string: "https://github.com/farkhodkh")!)
                }
            }
            
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup (placement: .navigationBarTrailing) {
                    Button() {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    
                    Button() {
                        saveUser()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
        .accentColor(.red)
    }
    
    func saveUser() {
        print("User saved")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif


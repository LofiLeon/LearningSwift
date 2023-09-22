//
//  KeyboardFocus.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Leon Grimmeisen on 07.07.22.
//

import SwiftUI

struct KeyboardFocus: View {
    
    enum OnboardingField {
        case name
        case username
        case password
    }
    
    @FocusState private var fieldInFocus: OnboardingField?
    
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            
            Group {
                TextField("Your name...", text: $name)
                    .focused($fieldInFocus, equals: .name)
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.brightness(0.25))
                    .cornerRadius(10)
                    .padding()
                
                TextField("Your username...", text: $username)
                    .focused($fieldInFocus, equals: .username)
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.brightness(0.25))
                    .cornerRadius(10)
                    .padding()
                
                
                TextField("Your password...", text: $password)
                    .focused($fieldInFocus, equals: .password)
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.brightness(0.25))
                    .cornerRadius(10)
                    .padding()
            }

            Button("Sign up now!") {
                // validity checks
                let nameIsValid = !name.isEmpty
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                
                // keyboard logic
                if nameIsValid && usernameIsValid && passwordIsValid {
                    print("Signup successfull!")
                    fieldInFocus = nil
                } else if nameIsValid && usernameIsValid {
                    fieldInFocus = .password
                } else if nameIsValid {
                    fieldInFocus = .username
                } else {
                    fieldInFocus = .name
                }
            }
            // label
            .frame(maxWidth: 200)
            .frame(height: 75)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(20)
        }
    }
}

struct KeyboardFocus_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardFocus()
    }
}

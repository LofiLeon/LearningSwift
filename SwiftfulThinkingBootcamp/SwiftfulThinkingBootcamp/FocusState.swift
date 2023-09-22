//
//  FocusState.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Leon Grimmeisen on 07.07.22.
//

import SwiftUI

struct FocusState: View {
    
    enum OnboardingField {
        case name
        case username
        case password
    }
        
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    
    @FocusState private var fieldInFocus: OnboardingField?

    var body: some View {
        VStack {
            TextField("Your name...", text: $name)
                .focused($fieldInFocus)
                .padding()
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.25))
                .cornerRadius(10)
                .padding()
            
            TextField("Your username...", text: $username)
                .padding()
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.25))
                .cornerRadius(10)
                .padding()
            
            TextField("Your password...", text: $password)
                .padding()
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.25))
                .cornerRadius(10)
                .padding()
            
            Button("Sign up now!") {
                //
            }
            .frame(maxWidth: 200)
            .frame(height: 75)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(20)

        }
    }
}

struct FocusState_Previews: PreviewProvider {
    static var previews: some View {
        FocusState()
    }
}

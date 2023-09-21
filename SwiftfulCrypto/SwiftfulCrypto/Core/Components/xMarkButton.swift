//
//  XMarkButton.swift
//  SwiftfulCrypto
//
//  Created by Leon Grimmeisen on 24.08.22.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            
            print("pressed")
        }, label: {
          Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}

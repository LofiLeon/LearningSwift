//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Leon Grimmeisen on 21.08.22.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    // dismiss keyboard
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

//
//  PreviewProvider.swift
//  SwiftfulCrypto
//
//  Created by Leon Grimmeisen on 16.08.22.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() {}
    
    let coin = 
    
}

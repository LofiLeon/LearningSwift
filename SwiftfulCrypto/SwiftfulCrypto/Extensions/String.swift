//
//  String.swift
//  SwiftfulCrypto
//
//  Created by Leon Grimmeisen on 28.08.22.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}

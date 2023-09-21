//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by Leon Grimmeisen on 25.08.22.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}

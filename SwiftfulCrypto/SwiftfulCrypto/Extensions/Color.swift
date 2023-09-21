//
//  Color.swift
//  SwiftfulCrypto
//
//  Created by Leon Grimmeisen on 15.08.22.
//

import Foundation
import SwiftUI

extension Color {
     
    static let theme = ColorTheme()
    static let launch = LaunchTheme()

}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondary = Color("SecondaryTextColor")
    
}

struct ColorTheme2 {
    
    let accent = Color.blue
    let background = Color.blue.opacity(0.3)
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondary = Color("SecondaryTextColor")
    
}

struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}

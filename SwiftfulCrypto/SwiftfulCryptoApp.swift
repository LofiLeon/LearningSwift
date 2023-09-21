//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Leon Grimmeisen on 15.08.22.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
        
    @StateObject private var vm = HomeViewModel()
    @State private var showLaunchview: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some Scene {
        WindowGroup {
            
            ZStack {
                NavigationView {
                    HomeView()
                        .navigationBarHidden(true)
                }
                .navigationViewStyle(StackNavigationViewStyle()) // to make it look good on iPad
                .environmentObject(vm)
                ZStack {
                    if showLaunchview {
                        LaunchView(showLaunchView: $showLaunchview)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
                
            }
            
            
            
            
        }
    }
}

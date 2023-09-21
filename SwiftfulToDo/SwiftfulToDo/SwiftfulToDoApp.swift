//
//  SwiftfulToDoApp.swift
//  SwiftfulToDo
//
//  Created by Leon Grimmeisen on 07.07.22.
//

import SwiftUI

@main
struct SwiftfulToDoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}

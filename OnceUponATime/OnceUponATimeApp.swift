//
//  OnceUponATimeApp.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/8/22.
//

import SwiftUI
import Firebase

@main
struct OnceUponATimeApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

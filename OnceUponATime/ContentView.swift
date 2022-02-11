//
//  ContentView.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/8/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var firebaseManager = FirebaseManager.instance
    var body: some View {
        Login()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

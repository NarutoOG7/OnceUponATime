//
//  ContentView.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            ExplorePage()
                .tabItem {
                    Text("Explore")
                }
                .tag(0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

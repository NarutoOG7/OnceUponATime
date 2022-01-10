//
//  SearchBar.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/9/22.
//

import SwiftUI

struct SearchBar: View {
    @State var searchText: String = ""
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.4046179366)))
                .frame(height: 38)
            HStack {
                Spacer()
                Image(systemName: "magnifyingglass")
                TextField("Search By Location or Activity", text: $searchText)
                    
            }
        }
    }
}

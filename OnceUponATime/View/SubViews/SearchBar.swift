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
                .fill(Color.black)
                .frame(height: 39)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(height: 38)
                HStack {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                    TextField("Search By Location or Activity", text: $searchText)
                    Spacer()
                }
            }
            .padding(.horizontal, 0.5)
            
        }
    }
}

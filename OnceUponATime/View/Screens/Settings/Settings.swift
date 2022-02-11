//
//  Settings.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/26/22.
//

import SwiftUI

struct Settings: View {
    @ObservedObject var authorization = Authorization.instance
    var body: some View {
        VStack {
            Text("Home")
            Button(action: {
                authorization.signOut()
            }, label: {
                Text("Sign Out")
                    .background(Color.gray)
            })
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

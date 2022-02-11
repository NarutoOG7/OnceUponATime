//
//  User.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/11/22.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String = ""
    var email: String = ""
}

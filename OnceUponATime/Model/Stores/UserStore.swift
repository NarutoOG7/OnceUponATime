//
//  UserStore.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/11/22.
//

import Foundation

class UserStore: ObservableObject {
    @Published var users: [User] = []
    
//    var logedInUser: User = User(id: "1", name: "Spencer", email: "23slowmojo@gmail.com")
    var logedInUser: User = User(id: "3", name: "Mac Miller", email: "mcMAC7@gmail.com")
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        users = [
            User(id: "1", name: "Spencer", email: "23slowmojo@gmail.com"),
            User(id: "2", name: "Peyton", email: "peynt18@gmail.com"),
            User(id: "3", name: "Mac Miller", email: "mcMAC7@gmail.com")
        ]
    }
}

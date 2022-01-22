//
//  StoreManager.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/9/22.
//

import Foundation

class StoreManager {
    
    static let instance = StoreManager()
    
    var locationStore = LocationStore()
    var userStore = UserStore()
    
}

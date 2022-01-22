//
//  FirebaseManager.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/22/22.
//

import Foundation
import Fire
// Firebase services
var database: FIRDatabase!
var storage: FIRStorage!
...
// Initialize Database, Auth, Storage
database = FIRDatabase.database()
storage = FIRStorage.storage()
...
// Initialize an array for your pictures
var picArray: [UIImage]()

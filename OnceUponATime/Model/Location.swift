//
//  Location.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/9/22.
//

import Foundation

struct Location: Identifiable {
    struct Address {
        var address: String = ""
        var city: String = ""
        var state: String = ""
        var zipCode: String = ""
        var country: String = ""

        func shortAddress() -> String {
            address + ", " + city + ", " + state
        }

        func fullAddress() -> String {
            address + ", " + city + ", " + state + " " + zipCode + " " + country
        }
    }
    
    var id = ""
    var name: String = ""
    var images: [String] = []
    var address: Address = Address()
    var description: String = ""
    var moreInfoLink: String = ""
    var avgRating: Double = 3.5
//    var rating: [Int : String] = [:]

 
//    func getAvgRating() -> Int {
//        var totalScore = 0
//        let ratings = Array(rating.keys)
//        for rate in ratings {
//            totalScore += rate
//        }
//        return totalScore / ratings.count
//    }
}



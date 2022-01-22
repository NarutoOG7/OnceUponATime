//
//  Location.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/9/22.
//

import Foundation
import MapKit
import CoreLocation
import SwiftUI

struct Location: Identifiable {
    
    static let example = Location(id: "5",
                             name: "Bannack",
//                             images: [Location.LocImage(image: Image("bannack"))],
//                             Location.LocImage(image: Image("hotelRoom")), Location.LocImage(image: Image("bannack"))]
                             images: [Image("bannack"), Image("hotelRoom"), Image("bannack"), Image("hotelRoom"), Image("bannack")],
                             address: Location.Address(address: "721 Bannack Rd", city: "Dillon", state: "MT", zipCode: "59725", country: "USA"),
                             description: "Bannack State Park is a National Historic Landmark and is the best preserved of all Montana ghost towns. Back in the “Old West”, during the mighty gold rush of 1862, Bannack’s population grew over 3,000. Today, no residents remain in this town.",
                             moreInfoLink: "https://fwp.mt.gov/stateparks/bannack-state-park", avgRating: 5, locationType: ["Ghost Town", "Historic Location"])

    
    var id = ""
    var name: String = ""
    var images: [Image] = []
    var address: Address = Address()
    var description: String = ""
    var moreInfoLink: String = ""
    var avgRating: Double = 3.5
    var locationType: [String] = []
    var coordinates: CLLocationCoordinate2D?
    var distanceToUser: Double?
    
    mutating func assignCoordinates(coordinates: CLLocationCoordinate2D) {
        self.coordinates = coordinates
    }

    
    struct Address {
        var address: String = ""
        var city: String = ""
        var state: String = ""
        var zipCode: String = ""
        var country: String = ""
        
        
        func shortAddress() -> String {
            address + ", " + city
        }
        
        func mediumAddress() -> String {
            address + ", " + city + ", " + state 
        }
        
        func fullAddress() -> String {
            address + ", " + city + ", " + state + " " + zipCode + " " + country
        }
        
    }
    
//    struct LocImage: Identifiable, Hashable {
//        var id = UUID()
//        var image: Image
//
//        func hash(into hasher: inout Hasher) {
//            hasher.combine(id)
//        }
//    }
    
}

struct FavoriteLocation: Identifiable {
    var id = UUID()
    var location = Location()
    var user = User()
    
}



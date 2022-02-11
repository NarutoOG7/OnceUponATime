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
import Firebase

struct Location: Identifiable {

    static let example = Location(id: 1111,
                             name: "Bannack",
                             address: Address(address: "721 Bannack Rd", city: "Dillon", state: "MT", zipCode: "59725", country: "USA"),
                             description: "Bannack State Park is a National Historic Landmark and is the best preserved of all Montana ghost towns. Back in the “Old West”, during the mighty gold rush of 1862, Bannack’s population grew over 3,000. Today, no residents remain in this town.",
                             moreInfoLink: "https://fwp.mt.gov/stateparks/bannack-state-park",
                             review: Location.Review(avgRating: "5", lastRating: "5", lastReview: "Must visit anytime you are in Montana!", user: "Spencer"),
                             locationType: "Ghost Town",
                             coordinates: nil,
                             imageName: "FairbanksBridge.jpg",
                             baseImage: nil,
                             distanceToUser: nil)
    
    var id: Int
    var name: String
    var address: Address
    var description: String
    var moreInfoLink: String
    var review: Review?
    var locationType: String
    var coordinates: CLLocationCoordinate2D?
    var imageName: String
    var baseImage: Image?
    var distanceToUser: Double?
    
    init(id: Int, name: String, address: Address, description: String, moreInfoLink: String, review: Review?, locationType: String, coordinates: CLLocationCoordinate2D?, imageName: String, baseImage: Image?, distanceToUser: Double?) {
        self.id = id
        self.name = name
        self.address = address
        self.description = description
        self.moreInfoLink = moreInfoLink
        self.review = review
        self.locationType = locationType
        self.coordinates = coordinates
        self.imageName = imageName
        self.baseImage = baseImage
        self.distanceToUser = distanceToUser
    }
    
    
    mutating func assignCoordinates(coordinates: CLLocationCoordinate2D) {
        self.coordinates = coordinates
    }
    

    
    
    
    struct Review {
        var avgRating: String
        var lastRating: String
        var lastReview: String
        var user: String
    }
    
    struct Images {
        var id: Int
        var imageURL: String
        var locationID: Int
    }
}



struct FavoriteLocation: Identifiable {
    var id: UUID
    var location: Location
    var user: User
    
}



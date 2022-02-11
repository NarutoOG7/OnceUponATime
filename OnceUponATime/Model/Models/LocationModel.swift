//
//  LocationModel.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/24/22.
//

import SwiftUI
import CoreLocation

//class LocationModel: ObservableObject, Identifiable {
//    
//    static let example = LocationModel(id: 1111,
//                             name: "Bannack",
//                             address: Address(address: "721 Bannack Rd", city: "Dillon", state: "MT", zipCode: "59725", country: "USA"),
//                             description: "Bannack State Park is a National Historic Landmark and is the best preserved of all Montana ghost towns. Back in the “Old West”, during the mighty gold rush of 1862, Bannack’s population grew over 3,000. Today, no residents remain in this town.",
//                             moreInfoLink: "https://fwp.mt.gov/stateparks/bannack-state-park",
//                             review: Location.Review(avgRating: "5", lastRating: "5", lastReview: "Must visit anytime you are in Montana!", user: "Spencer"),
//                             locationType: "Ghost Town",
//                             coordinates: nil,
//                             imageName: "FairbanksBridge.jpg",
//                             baseImage: nil,
//                             distanceToUser: nil)
//    
//    var id: Int
//    var name: String
//    var address: Address
//    var description: String
//    var moreInfoLink: String
//    var review: Location.Review?
//    var locationType: String
//    var coordinates: CLLocationCoordinate2D?
//    var imageName: String
//    var baseImage: Image?
//    var distanceToUser: Double?
//    
//    init(id: Int, name: String, address: Address, description: String, moreInfoLink: String, review: Location.Review?, locationType: String, coordinates: CLLocationCoordinate2D?, imageName: String, baseImage: Image?, distanceToUser: Double?) {
//        self.id = id
//        self.name = name
//        self.address = address
//        self.description = description
//        self.moreInfoLink = moreInfoLink
//        self.review = review
//        self.locationType = locationType
//        self.coordinates = coordinates
//        self.imageName = imageName
//        self.baseImage = baseImage
//        self.distanceToUser = distanceToUser
//        
//        self.image = getImage()
//    }
//    
//    
//    @Published var image: Image?
//
//    func getImage() -> Image {
//        FirebaseManager.instance.getImageFromURLString(self.imageName)
//    }
//
//}

struct Address {
    var address: String
    var city: String
    var state: String
    var zipCode: String
    var country: String
    
    init(address: String, city: String, state: String, zipCode: String, country: String) {
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.country = country
    }
    
    func streetCity() -> String {
        address + ", " + city
    }
    
    func streetCityState() -> String {
        address + ", " + city + ", " + state
    }
    
    func cityState() -> String {
        city + ", " + state
    }
    
    func fullAddress() -> String {
        address + ", " + city + ", " + state + " " + zipCode + " " + country
    }
}




//    init(id: UUID?, name: String?, imageURLs: [String]?, address: Location.Address?, description: String?, moreInfoLink: String?, review: Location.Review?, locationType: String?) {
//        self.id = id
//        self.name = name
//        self.imageURLs = imageURLs
//        self.address = address
//        self.description = description
//        self.moreInfoLink = moreInfoLink
//        self.review = review
//        self.locationType = locationType
//    }

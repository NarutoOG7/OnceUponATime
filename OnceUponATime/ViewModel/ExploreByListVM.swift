//
//  ExplorePageVM.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/11/22.
//

import SwiftUI
import Firebase

class ExploreByListVM: ObservableObject {
    static let instance = ExploreByListVM()
    @Published var isShowingMap = false
    
//    @Published var locations = [Location]()
//    @Published var images = [Image]()
    
//    private var db = Firestore.firestore()
    
//    init() {
//        getHauntedHotels()
//    }
    

//    func getHauntedHotels() {
//        let ref = Database.database().reference().child("Haunted Hotels")
//        ref.observe(DataEventType.value) { (snapshot) in
//            if snapshot.childrenCount > 0 {
//
//                self.locations.removeAll()
//
//                for location in snapshot.children.allObjects as! [DataSnapshot] {
//                    let data = location.value as? [String: AnyObject]
//                    let name = data?["name"] as? String ?? ""
//                    let imageURLs = data?["imageURLs"] as? [String] ?? []
//                    let street = data?["address/street"] as? String ?? ""
//                    let city = data?["address/city"] as? String ?? ""
//                    let state = data?["address/state"] as? String ?? ""
//                    let country = data?["address/country"] as? String ?? ""
//                    let zipCode = data?["address/zipCode"] as? String ?? ""
//                    let description = data?["description"] as? String ?? ""
//                    let moreInfoLink = data?["moreInfoLink"] as? String ?? ""
//                    let avgRating = data?["review/avgRating"] as? String ?? ""
//                    let lastReview = data?["review/lastReview"] as? String ?? ""
//                    let lastRating = data?["review/lastRating"] as? String ?? ""
//                    let lastReviewUser = data?["review/LastReviewUser"] as? String ?? ""
//                    let locationType = data?["locationType"] as? String ?? ""
//
//                    let local = Location(id: UUID(), name: name, imageURLs: imageURLs, address: Location.Address(address: street, city: city, state: state, zipCode: zipCode, country: country), description: description, moreInfoLink: moreInfoLink, review: Location.Review(avgRating: avgRating, lastRating: lastRating, lastReview: lastReview, user: lastReviewUser), locationType: locationType, coordinates: nil, uiImages: [], distanceToUser: nil)
//
//                    self.locations.append(local)
////                    let name = locObject?["name"]
////                    let city = locObject?["address/city"]
////                    let country = locObject?["address/country"]
////                    let state = locObject?["address/state"]
////                    let street = locObject?["address/street"]
////                    let zipCode = locObject?["address/zipCode"]
////                    let description = locObject?["description"]
////                    let hoursOfOperation = locObject?["hoursOfOperation"]
////                    let imageURLs = locObject?["imageURLs"]
////
//                }
//            }
//        }
////        ref.getData { (error, data) in
//            if let error = error {
//                print("Error getting documents in func getLocations...FirebaseManager: \(error)")
//            } else {
//
//                let data = data
//                let name = data["name"] as? String ?? ""
//                let imageURLs = data["imageURLs"] as? [String] ?? []
//                let street = data["address/street"] as? String ?? ""
//                let city = data["address/city"] as? String ?? ""
//                let state = data["address/state"] as? String ?? ""
//                let country = data["address/country"] as? String ?? ""
//                let zipCode = data["address/zipCode"] as? String ?? ""
//                let description = data["description"] as? String ?? ""
//                let moreInfoLink = data["moreInfoLink"] as? String ?? ""
//                let lastReview = data["lastReview/review"] as? String ?? ""
//                let lastRating = data["lastReview/rating"] as? String ?? ""
//                let lastReviewUser = data["lastReview/user"] as? String ?? ""
//                let locationType = data["locationType"] as? [String] ?? []
//                return Location(id: .init(), name: name, imageURLs: imageURLs, address: Location.Address(address: street, city: city, state: state, zipCode: zipCode, country: country), description: description, moreInfoLink: moreInfoLink, lastReview: Location.LastReview(rating: lastRating, review: lastReview, user: lastReviewUser), locationType: locationType, coordinates: nil, distanceToUser: nil)
//        }
//            }
//    }
    
//    func getLocations() {
//        db.collection("Locations").getDocuments() { (querySnapshot, error) in
//            if let error = error {
//                print("Error getting documents in func getLocations...FirebaseManager: \(error)")
//            } else {
//                guard let documents = querySnapshot?.documents else {
//                    print("no locations")
//                    return
//                }
//
//                self.locations = documents.map { queryDocumentSnapshot -> Location in
//                    let data = queryDocumentSnapshot.data()
//                    let name = data["name"] as? String ?? ""
//                    let imageURLs = data["imageURLs"] as? [String] ?? []
//                    let street = data["address/street"] as? String ?? ""
//                    let city = data["address/city"] as? String ?? ""
//                    let state = data["address/state"] as? String ?? ""
//                    let country = data["address/country"] as? String ?? ""
//                    let zipCode = data["address/zipCode"] as? String ?? ""
//                    let description = data["description"] as? String ?? ""
//                    let moreInfoLink = data["moreInfoLink"] as? String ?? ""
//                    let avgRating = data["review/avgRating"] as? String ?? ""
//                    let lastReview = data["review/lastReview"] as? String ?? ""
//                    let lastRating = data["review/lastRating"] as? String ?? ""
//                    let lastReviewUser = data["review/lastReviewUser"] as? String ?? ""
//                    let locationType = data["locationType"] as? String ?? ""
//                    return Location(id: .init(), name: name, imageURLs: imageURLs, address: Location.Address(address: street, city: city, state: state, zipCode: zipCode, country: country), description: description, moreInfoLink: moreInfoLink, review: Location.Review(avgRating: avgRating, lastRating: lastRating, lastReview: lastReview, user: lastReviewUser), locationType: locationType, coordinates: nil, uiImages: [], distanceToUser: nil)
//                }
//                print(self.locations)
//            }
//        }
//    }
    

}

//
//  FirebaseManager.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/22/22.
//

import SwiftUI
import Firebase
import CoreLocation
import GeoFire

class FirebaseManager: ObservableObject {
    
    enum Queries: String, CaseIterable {
        case hauntedHotels = "Haunted Hotels"
        case ghostTowns = "Ghost Towns"
        
    }
    
    static let instance = FirebaseManager()
    
    let db = Firestore.firestore()
    let locationStore = StoreManager.instance.locationStore
   
    @Published var images: [Location.Images] = []
    init() {
        getHauntedHotels()
//        setCoordinates()
        getImages()
    }
    
    
    func getHauntedHotels() {
        let ref = Database.database().reference().child("Haunted Hotels")
        ref.observe(DataEventType.value) { (snapshot) in
            if snapshot.childrenCount > 0 {
                
                self.locationStore.hauntedHotels.removeAll()
                
                
                for location in snapshot.children.allObjects as! [DataSnapshot] {
                    let data = location.value as? [String : AnyObject]
                    let id = data?["id"] as? Int ?? Int.random(in: 200...300)
                    let name = data?["name"] as? String ?? ""
                    let street = data?["street"] as? String ?? ""
                    let city = data?["city"] as? String ?? ""
                    let state = data?["state"] as? String ?? ""
                    let country = data?["country"] as? String ?? ""
                    let zipCode = data?["zipCode"] as? String ?? ""
                    let description = data?["description"] as? String ?? ""
                    let moreInfoLink = data?["moreInfoLink"] as? String ?? ""
                    let avgRating = data?["avgRating"] as? String ?? ""
                    let lastReview = data?["lastReview"] as? String ?? ""
                    let lastRating = data?["lastRating"] as? String ?? ""
                    let lastReviewUser = data?["lastReviewUser"] as? String ?? ""
                    let imageName = data?["imageName"] as? String ?? ""

                    let local = Location(id: id, name: name, address: Address(address: street, city: city, state: state, zipCode: zipCode, country: country), description: description, moreInfoLink: moreInfoLink, review: Location.Review(avgRating: avgRating, lastRating: lastRating, lastReview: lastReview, user: lastReviewUser), locationType: "Haunted Hotel", coordinates: nil, imageName: imageName, baseImage: nil, distanceToUser: nil)
//                    let local = LocationModel(id: id, name: name, address: Address(address: street, city: city, state: state, zipCode: zipCode, country: country), description: description, moreInfoLink: moreInfoLink, review: Location.Review(avgRating: avgRating, lastRating: lastRating, lastReview: lastReview, user: lastReviewUser), locationType: "Haunted Hotel", coordinates: nil, imageName: imageName, baseImage: nil, distanceToUser: nil)
//                    let local = LocationModel(id: id, name: name, address: Address(address: street, city: city, state: state, zipCode: zipCode, country: country), description: description, moreInfoLink: moreInfoLink, review: Location.Review(avgRating: avgRating, lastRating: lastRating, lastReview: lastReview, user: lastReviewUser), locationType: "Haunted Hotel", imageName: imageName)
                    self.locationStore.hauntedHotels.append(local)
                }
            }
        }
        
    }
    func getImages() {
        
        let ref = Database.database().reference().child("Images")
        ref.observe(DataEventType.value) { (snapshot) in
            if snapshot.childrenCount > 0 {
                for image in snapshot.children.allObjects as! [DataSnapshot] {
                    let data = image.value as? NSDictionary
                    let imageLocationID = data?["locationID"] as? Int ?? Int.random(in: 1000...2000)
                    let imageURL = data?["imageURL"] as? String ?? ""
                    let id = data?["id"] as? Int ?? Int.random(in: 3000...4000)
                    
                    let img = Location.Images(id: id, imageURL: imageURL, locationID: imageLocationID)
                    self.images.append(img)
                }
            }
        }
    }
    
    func getImageFromLocationID(id: Int, withCompletion completion: @escaping ((_ image: Location.Images) -> (Void))) {
        for image in self.images {
            if image.locationID == id {
                completion(image)
            }
        }
        
    }
    
    func getImageFromURLString(_ urlString: String) -> Image {
        var imageToReturn = Image("blank")
        let storageRef = Storage.storage().reference().child(urlString)
        storageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else { return }
            if let image = UIImage(data: data) {
               imageToReturn = Image(uiImage: image)
            }
        }
        return imageToReturn
    }
    
    //Get locations base of current location
    
    func getallDocs(center: CLLocationCoordinate2D, radius: Double, withCompletion completion: @escaping ((_ location: Location) -> (Void))) {
        
        locationStore.onMapLocations.removeAll()
        
        // Find pickups within 50km of Basecamp
        let center = center
        let radiusInKilometers: Double = radius
        
        // Each item in 'bounds' represents a startAt/endAt pair. We have to issue
        // a separate query for each pair. There can be up to 9 pairs of bounds
        // depending on overlap, but in most cases there are 4.
        let queryBounds = GFUtils.queryBounds(forLocation: center,
                                              withRadius: radiusInKilometers)
        let queries = queryBounds.compactMap { (bound) -> DatabaseQuery? in
            let ref = Database.database().reference().child("Haunted Hotels")
            return ref.queryOrderedByKey()
                .queryStarting(atValue: bound.startValue)
                .queryEnding(atValue: bound.endValue)

        }
        // Collect all the query results together into a single list
            
            // After all callbacks have executed, matchingDocs contains the result. Note that this
            // sample does not demonstrate how to wait on all callbacks to complete.
            for query in queries {
                query.getData { (error, dataSnapshot) in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return
                    }
                    
                    if dataSnapshot.childrenCount > 0 {
                        for location in dataSnapshot.children.allObjects as! [DataSnapshot] {
                            let data = location.value as? NSDictionary
                            let street = data?["street"] as? String ?? ""
                            let city = data?["city"] as? String ?? ""
                            let state = data?["state"] as? String ?? ""
                            let country = data?["country"] as? String ?? ""
                            let zipCode = data?["zipCode"] as? String ?? ""
                            let addressString = "\(street), \(city), \(state) \(zipCode), \(country)"
                            
                            UserLocationManager.instance.getCoordinatesFrom(addressString: addressString) { (coordinate) -> (Void) in
                                let cllocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                                let centerPoint = CLLocation(latitude: center.latitude, longitude: center.longitude)
                                
                                let distance = GFUtils.distance(from: centerPoint, to: cllocation)
                                
                                if distance <= radiusInKilometers {
                                    
                                    let id = data?["id"] as? Int ?? Int.random(in: 200...300)
                                    let name = data?["name"] as? String ?? ""
                                    let description = data?["description"] as? String ?? ""
                                    let moreInfoLink = data?["moreInfoLink"] as? String ?? ""
                                    let avgRating = data?["avgRating"] as? String ?? ""
                                    let lastReview = data?["lastReview"] as? String ?? ""
                                    let lastRating = data?["lastRating"] as? String ?? ""
                                    let lastReviewUser = data?["lastReviewUser"] as? String ?? ""
                                    
                                    let imageName = data?["imageName"] as? String ?? ""

//                                    let local = LocationModel(id: id, name: name, address: Address(address: street, city: city, state: state, zipCode: zipCode, country: country), description: description, moreInfoLink: moreInfoLink, review: Location.Review(avgRating: avgRating, lastRating: lastRating, lastReview: lastReview, user: lastReviewUser), locationType: "Haunted Hotel", coordinates: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude), imageName: imageName, baseImage: nil, distanceToUser: nil)

                                    let local = Location(id: id, name: name, address: Address(address: street, city: city, state: state, zipCode: zipCode, country: country), description: description, moreInfoLink: moreInfoLink, review: Location.Review(avgRating: avgRating, lastRating: lastRating, lastReview: lastReview, user: lastReviewUser), locationType: "Haunted Hotel", coordinates: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude), imageName: imageName, baseImage: nil, distanceToUser: nil)
                                    
                                    completion(local)

                            }
                        }
                    }
                    
                    
                }
            }
        }
        
    }
    
    
}
    
    
    extension Image {
        func data(url: URL?) -> Self {
            if let url = url,
               let data = try? Data(contentsOf: url) {
                return Image(uiImage: UIImage(data: data)!)
                    .resizable()
            }
            return self
                .resizable()
        }
    }




//import Combine
//
//
//let placeholder = UIImage(named: "blank")!
//struct FirebaseImage: View {
//    
//    
//    init(id: String) {
//        self.imageLoader = Loader(id)
//    }
//    
//    @ObservedObject private var imageLoader: Loader
//    
//    var image: UIImage? {
////        imageLoader.url.flatMap(UIImage.init)
//        imageLoader.data.flatMap(UIImage.init)
//    }
//    
//    var body: some View {
//        Image(uiImage: image ?? placeholder)
//            .resizable()
//            .aspectRatio(1, contentMode: .fit)
//            .cornerRadius(35)
//            .frame(width: 69.7, height: 69.7)
//    }
//}
//
//final class Loader: ObservableObject {
//    
//    @Published var data: Data?
//    @Published var url: URL?
//    
//    init(_ urlString: String) {
//        
//        let storageRef = Storage.storage().reference().child(urlString)
//        
//        storageRef.downloadURL { (url, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//            
//            guard let url = url else { return }
//            
//            
//            DispatchQueue.main.async {
//                self.data = url.dataRepresentation
////                self.url = url
//            }
//            
//        }
//        
////        storageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
////            
////            if let error = error {
////                print(error.localizedDescription)
////            }
////            DispatchQueue.main.async {
////                self.data = data
////            }
////        }
//    }
//}

//
//  SampleLocationData.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/9/22.
//

import Combine
import CoreLocation
import MapKit
import Firebase
import SwiftUI

class LocationStore: ObservableObject {
    
    var locationManager = UserLocationManager.instance
    @Published var locations: [Location] = []
    @Published var hauntedHotels: [Location] = []
    @Published var onMapLocations: [Location] = []
    @Published var nearbyLocations: [Location] = []
    @Published var favoritedLocations: [FavoriteLocation] = []
    
    @Published var selectedLocation: Location?
    
    var locationSelected: Location? {
        willSet {
            self.selectedLocation = newValue!
            // moved from UserLocationManager.swift   trying to refactor.. maybe I should save that part for later.. just get it working
            UserLocationManager.instance.getDistanceToLocation(location: newValue!) { distance in
                self.selectedLocationDistanceToUser = distance
            }
//            StoreManager.instance.locationStore.getImageFromLocationID(id: newValue!.id) { (locImage) -> (Void) in
//                newValue?.addImages(uiImage: <#T##UIImage#>)
//            }
//        }
    }
    }
    
    var selectedLocationDistanceToUser: Double = 0
    

   
    
//        for urlString in urlArray {
//            let ref = Storage.storage().reference(forURL: urlString)
//            ref.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
//                if let error = error {
//                    print("error getting image from url, URL: (\(urlString)), ERROR: \(error)")
//                } else {
//                    guard let data = data else {
//                        print("no images")
//                        return
//                    }
//                    completion((UIImage(data: data)?.cgImage)!)
////                    location.addImages(image: )
//                }
//            }
//        }
    
    
//    func setCoordinates() {
//        locations.enumerated().forEach { (index, location) in
//            
//            locationManager.getCoordinatesFrom(addressString: location.address.fullAddress()) { coordinates in
//                self.locations[index].coordinates = coordinates
//                }
//            }
//    }
    
}

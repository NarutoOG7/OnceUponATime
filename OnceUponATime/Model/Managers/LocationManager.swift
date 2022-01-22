//
//  LocationManager.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/11/22.
//
import SwiftUI
import MapKit
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject {
    static let instance = LocationManager()
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.585, longitude: -105.084), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    private let clLocationManager = CLLocationManager()
    @Published var currentLocation: CLLocation?
    @State private var cancellable: AnyCancellable?
    var selectedLocation: Location? {
        willSet {
            getDistanceToLocation(location: newValue ?? Location()) { distance in
                self.distance = distance
            }
        }
    }
    @Published var distance = 0.0
    @Published var displayedLocationRoute: MKRoute!
    
    override init() {
        super.init()
        
        clLocationManager.delegate = self
        clLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        clLocationManager.distanceFilter = kCLDistanceFilterNone
        clLocationManager.startUpdatingLocation()
        clLocationManager.requestWhenInUseAuthorization()
        
    }
    
    func requestLocation() {
        clLocationManager.requestWhenInUseAuthorization()
    }
    
    func setCurrentLocation() {
        cancellable = $currentLocation.sink { location in
            self.mapRegion = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 2, longitudinalMeters: 2)
        }
    }
    
    func getDistanceToLocation(location: Location, withCompletion completion: @escaping ((_ distance: Double) -> (Void))) {
        let request = MKDirections.Request()
        if let currentLocation = currentLocation {
            var destCoordinates = CLLocationCoordinate2D()
            
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: currentLocation.coordinate))
            
            getCoordinatesFrom(location: location) { coordinates in
                destCoordinates = coordinates
                
                request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destCoordinates))
                request.transportType = MKDirectionsTransportType.automobile
                
                let directions = MKDirections(request: request)
                directions.calculate { (response, error) in
                    guard let response = response else {
                        print(error.debugDescription)
                        return
                    }
                    let route = response.routes[0]
                    print(route.distance * 0.000621)
                    completion(route.distance * 0.000621)
                }
            }
        }
    }
    
    func getCoordinatesFrom(location: Location, withCompletion completion: @escaping ((_ coordinates: CLLocationCoordinate2D) -> (Void))) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(location.address.fullAddress()) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let loc = placemarks.first?.location
            else {
                // handle no location found
                print("error on forward geocoding.. get coordinates from location.. \(location.name)")
                return
            }
            completion(loc.coordinate)
        }
    }
    
    func getAddressFrom(coordinates: CLLocationCoordinate2D, withCompletion completion: @escaping ((_ location: Location.Address) -> (Void))) {
        let location  = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first
            else {
                // Handle error
                return
            }
            if let buildingNumber = location.subThoroughfare,
               let street = location.thoroughfare,
               let city = location.locality,
               let state = location.administrativeArea,
               let zip = location.postalCode,
               let country = location.country {
                
                let address = Location.Address(
                    address: "\(buildingNumber) \(street)",
                    city: city,
                    state: state,
                    zipCode: zip,
                    country: country)
                completion(address)
            }
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        
        //        DispatchQueue.main.async {
        self.currentLocation = location
        //        }
    }
    
    
    //MARK: - Handling user loction choice
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            print("DEBUG: Not Determined")
        case .restricted:
            print("DEBUG: Restricted")
        case .denied:
            print("DEBUG: Denied")
        case .authorizedAlways:
            print("DEBUG: Auth always")
        case .authorizedWhenInUse:
            print("DEBUG: Auth when in use")
        @unknown default:
            break
        }
    }
    
}



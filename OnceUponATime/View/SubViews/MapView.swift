//
//  MapView.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/11/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    @State var locationStore = StoreManager.instance.locationStore
    @ObservedObject var locationManager = UserLocationManager.instance
    
    var body: some View {

        Map(coordinateRegion: $locationManager.region,
            annotationItems: locationStore.onMapLocations) { location in
            
            MapAnnotation(coordinate: location.coordinates ?? CLLocationCoordinate2D()) {

                Button(action: {
                    locationStore.selectedLocation = location
                    print("location tapped \(location.name)")
                }, label: {
                    ZStack {
                        Circle()
                            .stroke(Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)), lineWidth: 3)
                        
    
                        
                        LocationImage(location: location)
                        
                    }
                    .frame(width: 70, height: 70)
                })
            }
        }
        
        .ignoresSafeArea()
        
        
        
    }
}


import SDWebImageSwiftUI
import Firebase

struct LocationImage: View {
    
    var location: Location
    @State var url = ""
    
    var body: some View {
        
        VStack {
            
            if url == "" {
                Loader()
            } else {
                WebImage(url: URL(string: url)!)
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .cornerRadius(35)
                                    .frame(width: 69.7, height: 69.7)
            }
        }
        .onAppear {
            
            let storage = Storage.storage().reference()
            storage.child(location.imageName).downloadURL { (url, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    guard let url = url else { return }
                    DispatchQueue.main.async {
                        self.url = "\(url)"
                    }
                }
            }
        }
    }
}

struct Loader : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        
    }
}


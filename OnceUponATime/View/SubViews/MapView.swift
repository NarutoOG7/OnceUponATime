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
    
    @State var locations = StoreManager.instance.locationStore.locations
    @ObservedObject var locationManager = LocationManager.instance    
    
    var body: some View {
        Map(coordinateRegion: $locationManager.mapRegion,
            annotationItems: locations) { location in
            MapAnnotation(coordinate: location.coordinates ?? CLLocationCoordinate2D()) {
                Button(action: {
                    locationManager.selectedLocation = location
                    print("location tapped \(location.name)")
                }, label: {
                    ZStack {
                        Circle()
                            .stroke(Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)), lineWidth: 3)
                        
                        if let image = location.images[0] {
                            
                            image
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .cornerRadius(35)
                                .frame(width: 69.7, height: 69.7)
                            
                        }
                        
                    }
                    .frame(width: 70, height: 70)
                })
                
            }
        }
        
        .ignoresSafeArea()
        
        
        
    }
}


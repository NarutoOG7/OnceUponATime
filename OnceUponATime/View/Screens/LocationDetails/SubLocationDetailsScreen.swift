//
//  CardShowLocationDetails.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/12/22.
//

import SwiftUI
import CoreLocation
import Contacts

struct CustomButton: View {
    var title: String
    var body: some View {
        Button(action: {
            
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBlue))
                    .frame(height: 60)
                
                Text(title)
                    .font(.title)
                    .foregroundColor(Color.white)
                
            }
        })
    }
}

struct LocationTagCell: View {
    var tag: String
    var shouldShowDot: Bool
    var body: some View {
        HStack {
            Text(tag)
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7899186644)))
            Text(shouldShowDot ? "•" : "")
        }
    }
}

struct PostalAddressView: View {
    var location: Location
    var body: some View {
        VStack(alignment: .leading) {
            Text(location.address.address)
            Text(location.address.city)
            Text(location.address.state)
            Text(location.address.zipCode)
        }
    }
}

struct CustomScrollView<Content>: View where Content: View {
    @Binding var canScroll: Bool
    var content: () -> Content
    
    var body: some View {
        if canScroll {
            ScrollView(.vertical, showsIndicators: false, content: content)
        } else {
            content()
        }
    }
}

struct SubLocationDetailsScreen: View {
    
    @ObservedObject var locationManager = LocationManager.instance
    @State var firstFivesImages: [Image] = []
    @ObservedObject var slideCardVM = SlideUpCardVM.instance
    @ObservedObject var exploreByMapVM = ExploreByMapVM.instance
    var location: Location
    //    @ObservedObject var location = LocationManager.instance
    
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                ScrollView(.vertical, showsIndicators: false, content: { // cancel for run on sim // delete later
                    //
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 3) {
                            
                            exitButton
                            
                            Text(location.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.horizontal, 10)
                                .onAppear {
                                    for image in location.images {
                                        while firstFivesImages.count < 5 {
                                            firstFivesImages.append(image)
                                        }
                                    }
                                }
                        }
                        .frame(height: 70)
                        VStack(alignment: .leading) {
                            CustomScrollView(canScroll: $exploreByMapVM.locationDetailsCanScroll) {
                                
                                VStack {
                                    details
////                                    HStack {
////                                        Spacer()
//                                        ImageCollage(location: location)
////                                        Spacer()
////                                    }
                                    
                                    
                                    
                                    Spacer()
                                }
//                                .offset(x: -)
                                .frame(height: 2500)
                            }
                            
                        }
                    }
                    
                    
                }) // cancel for run on sim // delete later
            }
        }
    }
    
    var exitButton: some View {
        HStack {
            Spacer()
            Button(action: {
                locationManager.selectedLocation = nil
            }, label: {
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .foregroundColor(Color.gray)
                    .frame(width: 35, height: 35)
            })
            
        }
        .padding(.horizontal, 15)
        .padding(.top, 35)
    }
    
    var locationTags: some View {
        HStack {
            ForEach(location.locationType, id: \.self) { type in
                if location.locationType.last! == type {
                    LocationTagCell(tag: type, shouldShowDot: false)
                } else {
                    LocationTagCell(tag: type, shouldShowDot: true)
                }
            }
        }
    }
    
    var distanceLabel: some View {
        VStack(alignment: .trailing, spacing: -4) {
            Text("DISTANCE")
                .font(.footnote)
                .fontWeight(.bold)
            Text(String(format: "%.2f mi", locationManager.distance))
                .fontWeight(.light)
        }
    }
    
    var directionsButton: some View {
        Button(action: {
        }, label:  {
            IconImage(image: Image(systemName:"arrow.triangle.pull"), iconColor: Color.white,
                      tileBackground: true,
                      tileColor: Color(.systemBlue),
                      width: 100,
                      height: 100)
            
        })
    }
    
    var readMoreButton: some View {
        Button(action: {
            
        }, label: {
            Text("Read More")
        })
        .buttonStyle(PrimaryButtonStyle())
        
    }
    
    
    
    var details: some View {
        VStack(alignment: .leading) {
            locationTags
            
            HStack {
                FiveStars(location: location)
                    .padding(.top, 10)
                Spacer()
                distanceLabel
            }
            
            Text(location.address.fullAddress())
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7687285959)))
                .offset(y: 10)
            
            Text(location.description)
                .font(.body)
                .fontWeight(.light)
                .lineLimit(5)
                .padding(.top)
            
            HStack {
                Spacer()
                readMoreButton
                Spacer()
            }
            .padding()
        }
        .padding()
    }
}


struct ImageCollage: View {
    var location: Location
    //    @State var first: Image?
    //    @State var second: Image?
    //    @State var third: Image?
    //    @State var fourth: Image?
    //    @State var fifth: Image?
    
    //    init(location: Location) {
    //        self.location = location
    //        if location.images.indices.contains(0) {
    //            _first = State(initialValue: location.images[0]!.image)
    //        }
    //        if location.images.indices.contains(1) {
    //            _second = State(initialValue: location.images[1]!.image)
    //        }
    //        if location.images.indices.contains(2) {
    //            _third = State(initialValue: location.images[2]!.image)
    //        }
    //        if location.images.indices.contains(3) {
    //            _fourth = State(initialValue: location.images[3]!.image)
    //        }
    //        if location.images.indices.contains(4) {
    //            _fifth = State(initialValue: location.images[4]!.image)
    //        }
    //    }
    
    var body: some View {
        
        
        VStack {
            VStack(spacing: 6) {
                HStack {
                    
                    if location.images.indices.contains(0) {
                        if let first = location.images[0] {
                            Spacer()
                            first
                                .resizable()
                                .aspectRatio(1.15, contentMode: .fit)
                                .frame(minWidth: UIScreen.main.bounds.width / 1.15)
                            Spacer()
                        }
                    }
                }
                
                
                HStack(spacing: 6) {
                    VStack() {
                        if location.images.indices.contains(1) && location.images.count >= 5 {
                            if let second = location.images[1] {
                                second
                                    .resizable()
                                    .aspectRatio(0.8,contentMode: .fit)
                                    .frame(minWidth: UIScreen.main.bounds.width / 2.08)
//                                    .frame(width: UIScreen.main.bounds.width / 2.07, height: UIScreen.main.bounds.height / 4.175)
                            }
                        }
                        if location.images.indices.contains(3) && location.images.count >= 5  {
                            if let fourth = location.images[3] {
                                fourth
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    //                                    .frame(width: UIScreen.main.bounds.width / 2.07, height: UIScreen.main.bounds.height / 2.75)
                                    .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4.175)
                            }
                        } else {
                            Spacer()
                        }
                    }
                    VStack {
                        if location.images.indices.contains(2) && location.images.count >= 5  {
                            if let third = location.images[2] {
                                third
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width / 2.07, height: UIScreen.main.bounds.height / 4.175)
//                                    .frame(width: UIScreen.main.bounds.width / 2.07, height: UIScreen.main.bounds.height / 2.75)
                                
                            }
                        }
                        if location.images.indices.contains(4) && location.images.count >= 5 {
                            if let fifth = location.images[4] {
                                fifth
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width / 2.07, height: UIScreen.main.bounds.height / 4.175)
                            }
                        } else {
                            Spacer()
                        }
                    }
                }
                
            }
        }
    }
}


struct CardShowLocationDetails_Previews: PreviewProvider {
    static var previews: some View {
        SubLocationDetailsScreen(location: Location.example)
    }
}

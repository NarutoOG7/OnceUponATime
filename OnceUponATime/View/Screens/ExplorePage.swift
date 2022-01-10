//
//  ExplorePage.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/9/22.
//

import SwiftUI

struct LocationCollection: View {
    @ObservedObject var locationStore = StoreManager.instance.locationStore
    var title: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .offset(x: 15, y: 17)
            
            VStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        ForEach(locationStore.locations) { location in
                            VStack(alignment: .leading) {
                                LocationCell(location: location)
                            }
                        }
                    }
                })
            }
        }
        
    }
}

struct ExploreCollectionSet: View {
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 2) {
                    LocationCollection(title: "Top Rated")
                    LocationCollection(title: "Nearby")
                    LocationCollection(title: "Newest")
                }
            })
            .padding(.trailing, -40.0)
            
        }
        
    }
}

struct ExplorePage: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer(minLength: 30)
            Text("Good Evening, Spencer")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
            HStack(spacing: 15) {
                SearchBar()
                Spacer()
                IconImage(image: Image(systemName: "slider.vertical.3"), color: Color.black)
                IconImage(image: Image(systemName: "map"), color: Color.black)
            }
            
            Spacer(minLength: 20)
            Divider()
                .frame(height: 1.5)
                .background(Color.black)
            
            ExploreCollectionSet()
                .offset(x: -15, y: 15)
        }
        .padding()
        
    }
}

struct LocationCell: View {
    let location: Location
    var body: some View {
        HStack {
            Spacer(minLength: 15)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color(#colorLiteral(red: 0.4582606282, green: 0.4582606282, blue: 0.4582606282, alpha: 0.4873715753)), radius: 10)
                    .frame(width: 320, height: 270)
                VStack {
                    Image(location.images[0])
                        .resizable()
                    
                    Spacer(minLength: 12)
                    VStack(alignment: .leading) {
                        
                        Text(location.name)
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Spacer(minLength: 5)
                        
                        Text(location.address.shortAddress())
                            .font(.subheadline)
                            .fontWeight(.light)
                        
                        Spacer(minLength: 10)

                            HStack {
                                StarIcon(filled: location.avgRating > 0)
                                StarIcon(filled: location.avgRating > 1)
                                StarIcon(filled: location.avgRating > 2)
                                StarIcon(filled: location.avgRating > 3)
                                StarIcon(filled: location.avgRating > 4)
                            }
                        
                        Spacer()
                        
                    }
                    .offset(x: -35)
                    .frame(height: 80)
                    Spacer()
                    
                    
                }
                
                .frame(width: 320, height: 270)
                .cornerRadius(10)
                
                
                
            }
            .frame(width: 320, height: 305)
        }
    }
}

struct StarIcon: View {
    var filled: Bool = true
    var body: some View {
        Image(systemName: filled ? "star.fill" : "star")
            .foregroundColor(filled ? Color.yellow : Color.black.opacity(0.6))
    }
}

struct ExplorePage_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePage()
    }
}

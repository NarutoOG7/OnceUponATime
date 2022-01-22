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

struct ExploreByList: View {
    @ObservedObject var explorePageVM = ExploreByListVM.instance
    @ObservedObject var locationManager = LocationManager.instance
    var body: some View {
        if explorePageVM.isShowingMap {
            VStack {
                Spacer(minLength: 45)
                ExploreByMap()
            }
        } else {
            NavigationView {
                VStack(alignment: .leading) {
                    
                    Text("Good Evening, Spencer")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    
                    HStack(spacing: 9) {
                        SearchBar()
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            IconImage(image: Image(systemName: "slider.vertical.3"), iconColor: Color.black, tileBackground: false, tileColor: nil, width: 40, height: 40)
                        })
                        
                        Button(action: isShowingMap,
                               label: {
                            IconImage(image: Image(systemName: "map"), iconColor: Color.black, tileBackground: false, tileColor: nil, width: 40, height: 40)
                        })
                    }
                    
                    Spacer(minLength: 20)
                    Divider()
                        .frame(height: 1.5)
                        .background(Color.black)
                    
                    ExploreCollectionSet()
                        .offset(x: -15, y: 15)
                }
                .padding()
                .padding(.top, -70)
            }
        }
    }
    
    func isShowingMap() {
        explorePageVM.isShowingMap = true

    }
}





struct ExplorePage_Previews: PreviewProvider {
    static var previews: some View {
        ExploreByList()
    }
}

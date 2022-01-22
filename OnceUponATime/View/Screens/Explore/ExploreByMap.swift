//
//  ExploreByMapView.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/10/22.
//

import SwiftUI
import MapKit
import Combine

struct ExploreByMap: View {
    
    @ObservedObject var explorePageVM = ExploreByListVM.instance
    @ObservedObject var locationManger = LocationManager.instance
    @ObservedObject var selectedCardOption = SelectedExploreByMapFilter.instance
    
    @State var isShowingLocationDetails = false
    
    var body: some View {
        ZStack {
        ZStack {
                

            MapView()
            ZStack {
                VStack(spacing: 15) {
                    HStack(spacing: 15) {
                        SearchBar()
                        sliderButton
                        listButton
                    }
                    .padding()
                    
                    HStack {
                        Spacer()
                        VStack {
                            currentLocationButton
                            Spacer()
                        }
                        .offset(x: -15, y: -15)
                    }
                    Spacer()
                }
                .offset(y: 33)
            }

            SlideOverCard {
                cardDetails
            }
                
        }
        }
    }
    var cardDetails: some View {
        VStack {
            if let location = locationManger.selectedLocation {
                SubLocationDetailsScreen(location: location)
            } else {
                onMapDetails
            }
            Spacer()
        }
    }
    
    var sliderButton: some View {
        Button(action: {
            
        }, label: {
            IconImage(image: Image(systemName: "slider.vertical.3"), iconColor: Color.black, tileBackground: true, tileColor: Color.white, width: 40, height: 40)
        })
    }
    
    var listButton: some View {
        Button(action: setNotShowingMap,
               label: {
                IconImage(image: Image(systemName: "list.bullet"), iconColor: Color.black, tileBackground: true, tileColor: Color.white, width: 40, height: 40)
               })
    }
    
    var currentLocationButton: some View {
        Button(action: setCurrentLocation,
               label: {
                IconImage(image: Image(systemName: "location"), iconColor: Color.black, tileBackground: true, tileColor: Color.white, width: 40, height: 40)
                
               })
    }
    
    var onMapDetails: some View {
        VStack {
            HStack {
                EBMFilterButtons()
                    .offset(x: 20)
                Spacer()
            }
            EBMLocationLists(
                errorTitle:
                    (selectedCardOption.option == .onMap)
                    ? "No Markers Found" : "Nothing Nearby", errorMessage:
                        (selectedCardOption.option == .onMap)
                        ? "Try zooming out or pick a new spot on the map." : "There is nothing nearby")
        }
        .offset(y: 20)
    }
    
    
    
    func setNotShowingMap() {
        explorePageVM.isShowingMap = false
    }
    
    func setCurrentLocation() {
        withAnimation {
            LocationManager.instance.setCurrentLocation()
        }
    }
}



struct ExploreByMapView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreByMap()
    }
}

//MARK: - FilterButtons(OnMap/Nearby)

struct EBMFilterButtons: View {
    @ObservedObject var selectedCardOption = SelectedExploreByMapFilter.instance
    var body: some View {
        HStack {
            onMapButton
            nearbyButton
        }
    }
    
    var onMapButton: some View {
        Button(action: toggleDisplayTypes, label: {
            VStack {
                Text("On Map")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor((selectedCardOption.option == .onMap) ? Color.black : Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                Rectangle()
                    .fill((selectedCardOption.option == .onMap) ? Color.black : Color.clear)
                    .frame(width: 80, height: 1)
            }
        })
    }
    
    var nearbyButton: some View {
        Button(action: {
            selectedCardOption.switchOption()
        }, label: {
            VStack {
                Text("Nearby")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor((selectedCardOption.option == .nearby) ? Color.black : Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                Rectangle()
                    .fill((selectedCardOption.option == .nearby) ? Color.black : Color.clear)
                    .frame(width: 75, height: 1)
            }
        })
    }
    
    func toggleDisplayTypes() {
        selectedCardOption.switchOption()
        
    }
}


//MARK: - ExploreLocationsList

struct EBMLocationLists: View {
    @ObservedObject var locationStore = StoreManager.instance.locationStore
    @ObservedObject var selectedCardOption = SelectedExploreByMapFilter.instance
    var errorTitle: String
    var errorMessage: String
    var body: some View {
        
        if selectedCardOption.option == .onMap && !locationStore.onMapLocations.isEmpty {
            onMapLocations
        } else if selectedCardOption.option == .nearby && !locationStore.nearbyLocations.isEmpty {
            nearbyLocations
        } else {
            errorView
        }
    }
    
    var onMapLocations: some View {
        List(locationStore.onMapLocations, rowContent: SmallLocationCell.init)
    }
    
    var nearbyLocations: some View {
        List(locationStore.nearbyLocations, rowContent: SmallLocationCell.init)
    }
    
    var errorView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(errorTitle)
                    .font(.title)
                    .fontWeight(.bold)
                Text(errorMessage)
                    .font(.callout)
                
            }
            .offset(x: 20)
            Spacer()
        }
    }
}



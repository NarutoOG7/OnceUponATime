//
//  SampleLocationData.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/9/22.
//

import Combine

class StoreManager {
    
    static let instance = StoreManager()
    
    var locationStore = LocationStore()
    
}

class LocationStore: ObservableObject {
    
    static let instance = LocationStore()
    
    @Published var locations: [Location] = []
    
    init() {
        fetchLocations()
    }
    
    func fetchLocations() {
        locations = [
            Location(id: "1",
                     name: "Redmont Hotel",
                     images: ["hotelRoom"],
                     address: Location.Address(address: "2101 5th Ave N", city: "Birmingham", state: "AL", zipCode: "35203", country: "USA"),
                     description: "Built in 1925, this hotel was one of the first to introduce private baths to each room.",
                     moreInfoLink: "https://www.hilton.com/en/hotels/bhmcuqq-redmont-hotel-birmingham/?SEO_id=GMB-QQ-BHMCUQQ&y_source=1_Mjg1Njc0OC03MTUtbG9jYXRpb24uZ29vZ2xlX3dlYnNpdGVfb3ZlcnJpZGU%3D",
                     rating: [5 : "Awesome!",
                              5 : "Can't wait to go back! The room was nice and though something otherworldly may have been with me, I felt comfortable.",
                              3 : "I was put off by staff members. Great stay, but someone needs an attitude check.",
                              0 : "Absolutely dissapointed. Cockroaches in the bathtub!",
                              5 : "My teens loved it! They loved the ghost stories, and we were all a little anxious upon nighttime. I really enjoyed myself."]),
            Location(id: "2",
                     name: "Fort Condé Inn",
                     images: ["hotelRoom"],
                     address: Location.Address(address: "165 St Emanuel St", city: "Mobile", state: "AL", zipCode: "36602", country: "USA"),
                     description: "Being built in 1836, it holds the title of second-oldest house in Mobile. Now a hotel, the Fort Condé Inn is one of the most haunted hotels in the state. Staying the night in this famous Alabama hotel might come with an overwhelming feeling of dread as some claim to have heard disembodied voices and clawing sounds on the floor.",
                     moreInfoLink: "www.fortcondeinn.com",
                     rating: [5 : "Awesome!",
                              5 : "Can't wait to go back! The room was nice and though something otherworldly may have been with me, I felt comfortable.",
                              3 : "I was put off by staff members. Great stay, but someone needs an attitude check.",
                              1 : "Absolutely dissapointed. Cockroaches in the bathtub!",
                              5 : "My teens loved it! They loved the ghost stories, and we were all a little anxious upon nighttime. I really enjoyed myself."]),
            Location(id: "3",
                     name: "Grand Union Hotel",
                     images: ["hotelRoom"],
                     address: Location.Address(address: "1 Grand Union Square", city: "Fort Benton", state: "MT", zipCode: "59442", country: "USA"),
                     description: "On the banks of Fort Benton, lies Montana’s oldest operating hotel. With over 100 years of history between its walls, the Grand Union Hotel has earned quite a reputation. Many have claimed to have heard running children at night or the stomping of hooves from a horse. A horse whom a drunken cowboy tried to ride up the main staircase before the rider was shot dead by the hotel manager.",
                     moreInfoLink: "www.grandunionhotel.com",
                     rating: [4 : "Awesome!",
                              4 : "Can't wait to go back! The room was nice and though something otherworldly may have been with me, I felt comfortable.",
                              3 : "I was put off by staff members. Great stay, but someone needs an attitude check.",
                              1 : "Absolutely dissapointed. Cockroaches in the bathtub!",
                              5 : "My teens loved it! They loved the ghost stories, and we were all a little anxious upon nighttime. I really enjoyed myself."]),
            Location(id: "4",
                     name: "Sacajawea Hotel",
                     images: ["hotelRoom"],
                     address: Location.Address(address: "5 N Main St", city: "Three Forks", state: "MT", zipCode: "59752", country: "USA"),
                     description: "Historic hotel in the heart of Yellowstone Country, the Sacajawea hotel is a perfect spot for history aficionados.",
                     moreInfoLink: "www.sacajaweahotel.com",
                     rating: [4 : "Awesome!",
                              5 : "Can't wait to go back! The room was nice and though something otherworldly may have been with me, I felt comfortable.",
                              4 : "I was put off by staff members. Great stay, but someone needs an attitude check.",
                              5 : "My teens loved it! They loved the ghost stories, and we were all a little anxious upon nighttime. I really enjoyed myself."]),
            Location(id: "5",
                     name: "Bannack",
                     images: ["bannack"],
                     address: Location.Address(address: "721 Bannack Rd", city: "Dillon", state: "MT", zipCode: "59725", country: "USA"),
                     description: "Bannack State Park is a National Historic Landmark and is the best preserved of all Montana ghost towns. Back in the “Old West”, during the mighty gold rush of 1862, Bannack’s population grew over 3,000. Today, no residents remain in this town.",
                     moreInfoLink: "https://fwp.mt.gov/stateparks/bannack-state-park",
                     rating: [1 : "So Not Awesome!",
                              4 : "Can't wait to go back! The room was nice and though something otherworldly may have been with me, I felt comfortable.",
                              1 : "I was put off by staff members. Great stay, but someone needs an attitude check.",
                              1 : "Absolutely dissapointed. Cockroaches in the bathtub!"])
        ]
    }
    
}

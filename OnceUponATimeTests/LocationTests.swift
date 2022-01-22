//
//  LocationTests.swift
//  OnceUponATimeTests
//
//  Created by Spencer Belton on 1/11/22.
//

import XCTest
@testable import OnceUponATime
import CoreLocation

class LocationTests: XCTestCase {
    
    var sut: Location!

    override func setUpWithError() throws {
        super.setUp()
        sut = Location()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

//    func testCoordinate_ShouldReturnProperCoordinateFromAddress() {
////        let coordinateString = "45.1610, -112.995"
////        sut = Location(id: "test", name: "Bannack", images: ["bannack"], address: Location.Address(address: "721 Bannack Rd", city: "Dillon", state: "MT", zipCode: "59725", country: "USA"), description: "Blah", moreInfoLink: "", avgRating: 5.0)
//        print(sut.coordinate)
//        let coordinateString = "45.16, -112.995"
//        let coordinate = sut.getCoordinate(address: "721 Bannack Rd, Dillon, MT")
//        XCTAssertEqual(sut.getStringCoordingate(coordinate: coordinate), coordinateString)
//    }

}

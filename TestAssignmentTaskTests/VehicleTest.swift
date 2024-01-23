//
//  VehicleTest.swift
//  TestAssignmentTaskTests
//
//  Created by Sunil Kumar on 20/01/24.
//

import XCTest
@testable import TestAssignmentTask

class VehicleTest: XCTestCase {
    
    var mercedes: Vehicle!
       var boeing: Vehicle!

    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mercedes = Vehicle(type: .Car)
        boeing = Vehicle(type: .PassengerAircraft)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mercedes = nil
               boeing = nil
    }
    
    func testPlaneFasterThanCar() {
        let minutes = 60
        
        mercedes.startEngine(minutes: minutes)
        boeing.startEngine(minutes: minutes)
        XCTAssertTrue(boeing.returnKilometers() > mercedes.returnKilometers())
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

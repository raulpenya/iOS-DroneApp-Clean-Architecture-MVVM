//
//  TrackerDirectionTests.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import XCTest
@testable import Data
@testable import Tracker

final class TrackerDirectionTests: XCTestCase {
    func testGetDirectionWithStringNorth() {
        //Given
        let string = MockTrackerDirection.getDirectionNorth()
        //Then
        let direction = TrackerDirection.createDirection(with: string)
        //When
        XCTAssertNotNil(direction)
        XCTAssertEqual(direction, TrackerDirection.north)
    }
    
    func testGetDirectionWithStringEast() {
        //Given
        let string = MockTrackerDirection.getDirectionEast()
        //Then
        let direction = TrackerDirection.createDirection(with: string)
        //When
        XCTAssertNotNil(direction)
        XCTAssertEqual(direction, TrackerDirection.east)
    }
    
    func testGetDirectionWithStringSouth() {
        //Given
        let string = MockTrackerDirection.getDirectionSouth()
        //Then
        let direction = TrackerDirection.createDirection(with: string)
        //When
        XCTAssertNotNil(direction)
        XCTAssertEqual(direction, TrackerDirection.south)
    }
    
    func testGetDirectionWithStringWest() {
        //Given
        let string = MockTrackerDirection.getDirectionWest()
        //Then
        let direction = TrackerDirection.createDirection(with: string)
        //When
        XCTAssertNotNil(direction)
        XCTAssertEqual(direction, TrackerDirection.west)
    }
    
    func testGetDirectionWithStringERROR() {
        //Given
        let string = MockTrackerDirection.getDirectionERROR()
        //Then
        let direction = TrackerDirection.createDirection(with: string)
        //When
        XCTAssertNil(direction)
    }
}

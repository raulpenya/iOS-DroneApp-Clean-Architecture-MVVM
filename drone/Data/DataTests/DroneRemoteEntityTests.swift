//
//  DroneRemoteEntityTests.swift
//  DataTests
//
//  Created by raulbot on 20/1/23.
//

import XCTest
@testable import Data
@testable import Tracker

final class DroneRemoteEntityTests: XCTestCase {
    func testTransformToDomain() {
        //Given
        let drone = MockDroneRemoteEntity.getDrone()
        //Then
        let droneDomain = drone.transformToDomain()
        //When
        XCTAssertNotNil(droneDomain)
        XCTAssertEqual(drone.currentPosition.direction.rawValue, droneDomain?.currentPosition.direction.rawValue)
        XCTAssertEqual(drone.currentPosition.coordinate, droneDomain?.currentPosition.coordinate)
    }
    
    func testTransformToRemote() {
        //Given
        let drone = MockDrone.getDrone()
        //Then
        let droneRemote = drone.transformToRemote()
        //When
        XCTAssertNotNil(droneRemote)
        XCTAssertEqual(drone.currentPosition.direction.rawValue, droneRemote?.currentPosition.direction.rawValue)
        XCTAssertEqual(drone.currentPosition.coordinate, droneRemote?.currentPosition.coordinate)
    }
}

//
//  TrackerMovementTests.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import XCTest
@testable import Data
@testable import Tracker

final class TrackerMovementTests: XCTestCase {
    func testCreateMovementLeft() {
        //Given
        let string = MockTrackerMovement.getMovementStringLeft()
        //Then
        let movement = TrackerMovement.createMovement(with: string)
        //When
        XCTAssertNotNil(movement)
        XCTAssertEqual(movement, TrackerMovement.left)
    }
    
    func testCreateMovementLeftLOWERCASE() {
        //Given
        let string = MockTrackerMovement.getMovementStringLeftLOWERCASE()
        //Then
        let movement = TrackerMovement.createMovement(with: string)
        //When
        XCTAssertNotNil(movement)
        XCTAssertEqual(movement, TrackerMovement.left)
    }

    func testCreateMovementRight() {
        //Given
        let string = MockTrackerMovement.getMovementStringRight()
        //Then
        let movement = TrackerMovement.createMovement(with: string)
        //When
        XCTAssertNotNil(movement)
        XCTAssertEqual(movement, TrackerMovement.right)
    }
    
    func testCreateMovementForward() {
        //Given
        let string = MockTrackerMovement.getMovementStringForward()
        //Then
        let movement = TrackerMovement.createMovement(with: string)
        //When
        XCTAssertNotNil(movement)
        XCTAssertEqual(movement, TrackerMovement.forward)
    }
    
    func testCreateMovementERROR() {
        //Given
        let string = MockTrackerMovement.getMovementStringERROR()
        //Then
        let movement = TrackerMovement.createMovement(with: string)
        //When
        XCTAssertNil(movement)
    }
}

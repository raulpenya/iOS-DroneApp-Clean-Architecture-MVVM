//
//  TrackerPlateauTests.swift
//  TrackerTests
//
//  Created by raulbot on 18/1/23.
//

import XCTest
@testable import Tracker

final class TrackerPlateauTests: XCTestCase {
    //MARK: testIsPositionWithinTheBoundaries
    func testPositionINBoundariesTopRightCorner() {
        //Given
        let plateau = MockTrackerPlateau.getPlateau5x5()
        let point = CGPoint(x: 5, y: 5)
        //When
        let result = plateau.isPositionWithinTheBoundaries(point)
        //Then
        XCTAssertTrue(result)
    }
    
    func testPositionINBoundariesBottomLeftCorner() {
        //Given
        let plateau = MockTrackerPlateau.getPlateau5x5()
        let point = CGPoint.zero
        //When
        let result = plateau.isPositionWithinTheBoundaries(point)
        //Then
        XCTAssertTrue(result)
    }
    
    func testPositionYOUTBoundariesTopRightCorner() {
        //Given
        let plateau = MockTrackerPlateau.getPlateau5x5()
        let point = CGPoint(x: 5, y: 6)
        //When
        let result = plateau.isPositionWithinTheBoundaries(point)
        //Then
        XCTAssertFalse(result)
    }
    
    func testPositionXOUTBoundariesTopRightCorner() {
        //Given
        let plateau = MockTrackerPlateau.getPlateau5x5()
        let point = CGPoint(x: 6, y: 5)
        //When
        let result = plateau.isPositionWithinTheBoundaries(point)
        //Then
        XCTAssertFalse(result)
    }
    
    func testPositionYOUTBoundariesBottomLeftCorner() {
        //Given
        let plateau = MockTrackerPlateau.getPlateau5x5()
        let point = CGPoint(x: 0, y: -1)
        //When
        let result = plateau.isPositionWithinTheBoundaries(point)
        //Then
        XCTAssertFalse(result)
    }
    
    func testPositionXOUTBoundariesBottomLeftCorner() {
        //Given
        let plateau = MockTrackerPlateau.getPlateau5x5()
        let point = CGPoint(x: -1, y: 0)
        //When
        let result = plateau.isPositionWithinTheBoundaries(point)
        //Then
        XCTAssertFalse(result)
    }
}

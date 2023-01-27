//
//  TrackerTests.swift
//  TrackerTests
//
//  Created by raulbot on 18/1/23.
//

import XCTest
@testable import Tracker

final class TrackerTests: XCTestCase {
    //MARK: testIsPositionInBoundaries
    func testIsPositionInBoundariesTRUE() {
        //Given
        let position = MockTrackerPosition.getPositionWithDirection(.north)
        let plateau = MockTrackerPlateau.getPlateau5x5()
        let tracker = Tracker()
        //When
        let success = tracker.isPositionInBoundaries(position, in: plateau)
        //Then
        XCTAssertTrue(success)
    }
    
    func testIsPositionInBoundariesFALSE() {
        //Given
        let position = MockTrackerPosition.getPositionPointingNorthOutOfBounds()
        let plateau = MockTrackerPlateau.getPlateau5x5()
        let tracker = Tracker()
        //When
        let success = tracker.isPositionInBoundaries(position, in: plateau)
        //Then
        XCTAssertFalse(success)
    }
    
    //MARK: testExecute
    func testExecuteInstruction() {
        //Given
        let drone = MockTrackerDrone.getDrone(direction: .north)
        let instruction = MockTrackerInstruction.getInstructionTurnRight()
        let tracker = Tracker()
        //When
        let newDrone = tracker.execute(instruction: instruction, with: drone)
        //Then
        XCTAssertTrue(newDrone.currentPosition.direction == .east)
    }
    
    //MARK: testCalculatePath
    func testCalculatePathREQUESTED() {
        //Given
        let mission = MockTrackerMission.getREQUESTEDMission()
        let tracker = Tracker()
        //When
        let result = tracker.calculatePath(with: mission)
        //Then
        XCTAssertTrue(result.result.success)
        XCTAssertTrue(result.result.error == nil)
        XCTAssertEqual(result.result.position.direction, .north)
        XCTAssertEqual(result.result.position.coordinate, CGPoint(x: 1, y: 3))
    }

    func testCalculatePathERRORInitialPosition() {
        //Given
        let mission = MockTrackerMission.getMissionWithWRONGInitialPosition()
        let tracker = Tracker()
        //When
        let result = tracker.calculatePath(with: mission)
        //Then
        XCTAssertFalse(result.result.success)
        XCTAssertEqual((result.result.error! as NSError).code, TrackerErrors.initialPositionOutOfBounds.code)
    }
    
    func testCalculatePathERRORInstruction() {
        //Given
        let mission = MockTrackerMission.getMissionWithWRONGInstruction()
        let tracker = Tracker()
        //When
        let result = tracker.calculatePath(with: mission)
        //Then
        XCTAssertFalse(result.result.success)
        XCTAssertEqual((result.result.error! as NSError).code, TrackerErrors.instructionOutOfBounds.code)
    }
}

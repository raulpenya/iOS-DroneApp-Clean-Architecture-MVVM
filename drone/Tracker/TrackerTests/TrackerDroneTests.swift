//
//  TrackerDroneTests.swift
//  TrackerTests
//
//  Created by raulbot on 18/1/23.
//

import XCTest
@testable import Tracker

final class TrackerDroneTests: XCTestCase {
    //MARK: testTurnLeft
    func testTurnLeftPointingNorth() {
        //Given
        var drone = MockTrackerDrone.getDrone(direction: .north)
        //When
        drone.currentPosition = drone.turnLeft()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .west)
    }
    
    func testTurnLeftPointingEast() {
        //Given
        var drone = MockTrackerDrone.getDrone(direction: .east)
        //When
        drone.currentPosition = drone.turnLeft()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .north)
    }
    
    func testTurnLeftPointingSouth() {
        //Given
        var drone = MockTrackerDrone.getDrone(direction: .south)
        //When
        drone.currentPosition = drone.turnLeft()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .east)
    }
    
    func testTurnLeftPointingWest() {
        //Given
        var drone = MockTrackerDrone.getDrone(direction: .west)
        //When
        drone.currentPosition = drone.turnLeft()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .south)
    }
    
    //MARK: testTurnRight
    func testTurnRightPointingNorth() {
        //Given
        var drone = MockTrackerDrone.getDrone(direction: .north)
        //When
        drone.currentPosition = drone.turnRight()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .east)
    }
    
    func testTurnRightPointingEast() {
        //Given
        var drone = MockTrackerDrone.getDrone(direction: .east)
        //When
        drone.currentPosition = drone.turnRight()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .south)
    }
    
    func testTurnRightPointingSouth() {
        //Given
        var drone = MockTrackerDrone.getDrone(direction: .south)
        //When
        drone.currentPosition = drone.turnRight()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .west)
    }
    
    func testTurnRightPointingWest() {
        //Given
        var drone = MockTrackerDrone.getDrone(direction: .west)
        //When
        drone.currentPosition = drone.turnRight()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .north)
    }
    
    //MARK: testMoveForward
    func testMoveForwardPointingNorth() {
        //Given
        var drone = MockTrackerDrone.getDrone(direction: .north)
        //When
        drone.currentPosition = drone.moveForward()
        //Then
        XCTAssertEqual(drone.currentPosition.coordinate, CGPoint(x: 0, y: 1))
    }
    
    func testMoveForwardPointingEast() {
        //Given
        var drone = MockTrackerDrone.getDrone(direction: .east)
        //When
        drone.currentPosition = drone.moveForward()
        //Then
        XCTAssertEqual(drone.currentPosition.coordinate, CGPoint(x: 1, y: 0))
    }
    
    func testMoveForwardPointingSouth() {
        //Given
        var drone = MockTrackerDrone.getDrone(direction: .south)
        //When
        drone.currentPosition = drone.moveForward()
        //Then
        XCTAssertEqual(drone.currentPosition.coordinate, CGPoint(x: 0, y: -1))
    }
    
    func testMoveForwardPointingWest() {
        //Given
        var drone = MockTrackerDrone.getDrone(direction: .west)
        //When
        drone.currentPosition = drone.moveForward()
        //Then
        XCTAssertEqual(drone.currentPosition.coordinate, CGPoint(x: -1, y: 0))
    }
    
    func testSpeed2MoveForwardPointingNorth() {
        //Given
        var drone = MockTrackerDrone.getDrone(speed: 2, direction: .north)
        //When
        drone.currentPosition = drone.moveForward()
        //Then
        XCTAssertEqual(drone.currentPosition.coordinate, CGPoint(x: 0, y: 2))
    }
    
    func testSpeed2MoveForwardPointingEast() {
        //Given
        var drone = MockTrackerDrone.getDrone(speed: 2, direction: .east)
        //When
        drone.currentPosition = drone.moveForward()
        //Then
        XCTAssertEqual(drone.currentPosition.coordinate, CGPoint(x: 2, y: 0))
    }
    
    func testSpeed2MoveForwardPointingSouth() {
        //Given
        var drone = MockTrackerDrone.getDrone(speed: 2, direction: .south)
        //When
        drone.currentPosition = drone.moveForward()
        //Then
        XCTAssertEqual(drone.currentPosition.coordinate, CGPoint(x: 0, y: -2))
    }
    
    func testSpeed2MoveForwardPointingWest() {
        //Given
        var drone = MockTrackerDrone.getDrone(speed: 2, direction: .west)
        //When
        drone.currentPosition = drone.moveForward()
        //Then
        XCTAssertEqual(drone.currentPosition.coordinate, CGPoint(x: -2, y: 0))
    }
    
    //MARK: testExecute
    func testExecuteMovementLeftPointingNorth() {
        //Given
        let drone = MockTrackerDrone.getDrone(direction: .north)
        let instruction = MockTrackerInstruction.getInstructionTurnLeft()
        //When
        let newDrone = drone.execute(movement: instruction.movement)
        //Then
        XCTAssertTrue(newDrone.currentPosition.direction == .west)
    }
    
    func testExecuteMovementRightPointingNorth() {
        //Given
        let drone = MockTrackerDrone.getDrone(direction: .north)
        let instruction = MockTrackerInstruction.getInstructionTurnRight()
        //When
        let newDrone = drone.execute(movement: instruction.movement)
        //Then
        XCTAssertTrue(newDrone.currentPosition.direction == .east)
    }
    
    func testExecuteMovementForwardPointingNorth() {
        //Given
        let drone = MockTrackerDrone.getDrone(direction: .north)
        let instruction = MockTrackerInstruction.getInstructionMoveForward()
        //When
        let newDrone = drone.execute(movement: instruction.movement)
        //Then
        XCTAssertEqual(newDrone.currentPosition.coordinate, CGPoint(x: 0, y: 1))
    }
}

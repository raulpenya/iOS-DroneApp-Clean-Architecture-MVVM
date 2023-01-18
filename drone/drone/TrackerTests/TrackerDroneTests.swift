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
        var drone = MockDrone.getDronePointingNorth()
        //When
        drone.currentPosition = drone.turnLeft()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .west)
    }
    
    func testTurnLeftPointingEast() {
        //Given
        var drone = MockDrone.getDronePointingEast()
        //When
        drone.currentPosition = drone.turnLeft()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .north)
    }
    
    func testTurnLeftPointingSouth() {
        //Given
        var drone = MockDrone.getDronePointingSouth()
        //When
        drone.currentPosition = drone.turnLeft()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .east)
    }
    
    func testTurnLeftPointingWest() {
        //Given
        var drone = MockDrone.getDronePointingWest()
        //When
        drone.currentPosition = drone.turnLeft()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .south)
    }
    
    //MARK: testTurnRight
    func testTurnRightPointingNorth() {
        //Given
        var drone = MockDrone.getDronePointingNorth()
        //When
        drone.currentPosition = drone.turnRight()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .east)
    }
    
    func testTurnRightPointingEast() {
        //Given
        var drone = MockDrone.getDronePointingEast()
        //When
        drone.currentPosition = drone.turnRight()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .south)
    }
    
    func testTurnRightPointingSouth() {
        //Given
        var drone = MockDrone.getDronePointingSouth()
        //When
        drone.currentPosition = drone.turnRight()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .west)
    }
    
    func testTurnRightPointingWest() {
        //Given
        var drone = MockDrone.getDronePointingWest()
        //When
        drone.currentPosition = drone.turnRight()
        //Then
        XCTAssertTrue(drone.currentPosition.direction == .north)
    }
    
    //MARK: testMoveForward
    func testMoveForwardPointingNorth() {
        //Given
        var drone = MockDrone.getDronePointingNorth()
        //When
        drone.currentPosition = drone.moveForward()
        //Then
        XCTAssertEqual(drone.currentPosition.coordinate, CGPoint(x: 0, y: 1))
    }
    
    func testMoveForwardPointingEast() {
        //Given
        var drone = MockDrone.getDronePointingEast()
        //When
        drone.currentPosition = drone.moveForward()
        //Then
        XCTAssertEqual(drone.currentPosition.coordinate, CGPoint(x: 1, y: 0))
    }
    
    func testMoveForwardPointingSouth() {
        //Given
        var drone = MockDrone.getDronePointingSouth()
        //When
        drone.currentPosition = drone.moveForward()
        //Then
        XCTAssertEqual(drone.currentPosition.coordinate, CGPoint(x: 0, y: -1))
    }
    
    func testMoveForwardPointingWest() {
        //Given
        var drone = MockDrone.getDronePointingWest()
        //When
        drone.currentPosition = drone.moveForward()
        //Then
        XCTAssertEqual(drone.currentPosition.coordinate, CGPoint(x: -1, y: 0))
    }
    
    //MARK: testExecute
    func testExecuteMovementLeftPointingNorth() {
        //Given
        let drone = MockDrone.getDronePointingNorth()
        let instruction = MockInstruction.getInstructionTurnLeft()
        //When
        let newDrone = drone.execute(movement: instruction.movement)
        //Then
        XCTAssertTrue(newDrone.currentPosition.direction == .west)
    }
    
    func testExecuteMovementRightPointingNorth() {
        //Given
        let drone = MockDrone.getDronePointingNorth()
        let instruction = MockInstruction.getInstructionTurnRight()
        //When
        let newDrone = drone.execute(movement: instruction.movement)
        //Then
        XCTAssertTrue(newDrone.currentPosition.direction == .east)
    }
    
    func testExecuteMovementForwardPointingNorth() {
        //Given
        let drone = MockDrone.getDronePointingNorth()
        let instruction = MockInstruction.getInstructionMoveForward()
        //When
        let newDrone = drone.execute(movement: instruction.movement)
        //Then
        XCTAssertEqual(newDrone.currentPosition.coordinate, CGPoint(x: 0, y: 1))
    }
    
    //MARK: mocks
    struct MockDrone: TrackerDrone {
        var speed: Double = 1
        var currentPosition: TrackerPosition
        
        static func getDronePointingNorth() -> MockDrone {
            return MockDrone(currentPosition: MockPosition.getPositionPointingNorth())
        }
        
        static func getDronePointingEast() -> MockDrone {
            return MockDrone(currentPosition: MockPosition.getPositionPointingEast())
        }
        
        static func getDronePointingSouth() -> MockDrone {
            return MockDrone(currentPosition: MockPosition.getPositionPointingSouth())
        }
        
        static func getDronePointingWest() -> MockDrone {
            return MockDrone(currentPosition: MockPosition.getPositionPointingWest())
        }
    }
    
    struct MockPosition: TrackerPosition {
        var direction: TrackerDirection
        var coordinate: CGPoint
        
        static func getPositionPointingNorth() -> MockPosition {
            return MockPosition(direction: .north, coordinate: .zero)
        }
        
        static func getPositionPointingEast() -> MockPosition {
            return MockPosition(direction: .east, coordinate: .zero)
        }
        
        static func getPositionPointingSouth() -> MockPosition {
            return MockPosition(direction: .south, coordinate: .zero)
        }
        
        static func getPositionPointingWest() -> MockPosition {
            return MockPosition(direction: .west, coordinate: .zero)
        }
    }
    
    struct MockInstruction: TrackerInstruction {
        var movement: TrackerMovement
        
        static func getInstructionTurnLeft() -> MockInstruction {
            return MockInstruction(movement: .left)
        }
        
        static func getInstructionTurnRight() -> MockInstruction {
            return MockInstruction(movement: .right)
        }
        
        static func getInstructionMoveForward() -> MockInstruction {
            return MockInstruction(movement: .forward)
        }
    }
}

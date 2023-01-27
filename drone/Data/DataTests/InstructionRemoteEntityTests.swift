//
//  InstructionRemoteEntityTests.swift
//  DataTests
//
//  Created by raulbot on 20/1/23.
//

import XCTest
@testable import Data
@testable import Tracker

final class InstructionRemoteEntityTests: XCTestCase {
    func testInstructionLeftTransformToDomain() {
        //Given
        let instruction = MockInstructionRemoteEntity.getInstructionLeft()
        //Then
        let instructionDomain = instruction.transformToDomain()
        //When
        XCTAssertNotNil(instructionDomain)
        XCTAssertEqual(instruction.movement.rawValue, instructionDomain?.movement.rawValue)
    }
    
    func testInstructionRigthTransformToDomain() {
        //Given
        let instruction = MockInstructionRemoteEntity.getInstructionRight()
        //Then
        let instructionDomain = instruction.transformToDomain()
        //When
        XCTAssertNotNil(instructionDomain)
        XCTAssertEqual(instruction.movement.rawValue, instructionDomain?.movement.rawValue)
    }
    
    func testInstructionForwardTransformToDomain() {
        //Given
        let instruction = MockInstructionRemoteEntity.getInstructionForward()
        //Then
        let instructionDomain = instruction.transformToDomain()
        //When
        XCTAssertNotNil(instructionDomain)
        XCTAssertEqual(instruction.movement.rawValue, instructionDomain?.movement.rawValue)
    }
    
    func testInstructionLeftTransformToRemote() {
        //Given
        let instruction = MockInstruction.getInstructionLeft()
        //Then
        let instructionRemote = instruction.transformToRemote()
        //When
        XCTAssertNotNil(instructionRemote)
        XCTAssertEqual(instruction.movement.rawValue, instructionRemote?.movement.rawValue)
    }
    
    func testInstructionRigthTransformToRemote() {
        //Given
        let instruction = MockInstruction.getInstructionRight()
        //Then
        let instructionRemote = instruction.transformToRemote()
        //When
        XCTAssertNotNil(instructionRemote)
        XCTAssertEqual(instruction.movement.rawValue, instructionRemote?.movement.rawValue)
    }
    
    func testInstructionForwardTransformToRemote() {
        //Given
        let instruction = MockInstruction.getInstructionForward()
        //Then
        let instructionRemote = instruction.transformToRemote()
        //When
        XCTAssertNotNil(instructionRemote)
        XCTAssertEqual(instruction.movement.rawValue, instructionRemote?.movement.rawValue)
    }
}

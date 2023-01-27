//
//  InstructionsRemoteEntityTests.swift
//  DataTests
//
//  Created by raulbot on 20/1/23.
//

import XCTest
@testable import Data
@testable import Tracker

final class InstructionsRemoteEntityTests: XCTestCase {
    func testTransformToDomain() {
        //Given
        let instructions = MockInstructionsRemoteEntity.getInstructions()
        //Then
        let instructionsDomain = instructions.transformToDomain()
        //When
        XCTAssertEqual(instructionsDomain?.instructions.count, 3)
        XCTAssertEqual(instructionsDomain?.instructions.count, instructions.instructions.count)
        XCTAssertEqual(instructionsDomain?.instructions[0].movement.rawValue, instructions.instructions[0].movement.rawValue)
        XCTAssertEqual(instructionsDomain?.instructions[1].movement.rawValue, instructions.instructions[1].movement.rawValue)
        XCTAssertEqual(instructionsDomain?.instructions[2].movement.rawValue, instructions.instructions[2].movement.rawValue)
    }
    
    func testTransformToRemote() {
        //Given
        let instructions = MockInstructions.getInstructions()
        //Then
        let instructionsRemote = instructions.transformToRemote()
        //When
        XCTAssertEqual(instructionsRemote?.instructions.count, 3)
        XCTAssertEqual(instructionsRemote?.instructions.count, instructions.instructions.count)
        XCTAssertEqual(instructionsRemote?.instructions[0].movement.rawValue, instructions.instructions[0].movement.rawValue)
        XCTAssertEqual(instructionsRemote?.instructions[1].movement.rawValue, instructions.instructions[1].movement.rawValue)
        XCTAssertEqual(instructionsRemote?.instructions[2].movement.rawValue, instructions.instructions[2].movement.rawValue)
    }
}

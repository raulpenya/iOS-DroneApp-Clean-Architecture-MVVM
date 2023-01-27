//
//  CustomStringConvertibleExtensionsTests.swift
//  droneTests
//
//  Created by raulbot on 26/1/23.
//

import XCTest
@testable import drone

final class CustomStringConvertibleExtensionsTests: XCTestCase {
    func testInstructionsDescription() {
        //Given
        let instruction = MockInstructions.getInstructions()
        //When
        let description = instruction.description
        //Then
        XCTAssertEqual(description.count, 3)
        XCTAssertEqual(description.count, instruction.instructions.count)
        XCTAssertEqual(Array(description)[0], "L")
        XCTAssertEqual(Array(description)[1], "R")
        XCTAssertEqual(Array(description)[2], "M")
    }
    
    func testPositionDescription() {
        //Given
        let position = MockPosition.getPosition()
        //When
        let description = position.description
        //Then
        XCTAssertEqual(Array(description).count, 5)
        XCTAssertEqual(Array(description)[0], "0")
        XCTAssertEqual(Array(description)[2], "0")
        XCTAssertEqual(Array(description)[4], "N")
    }
}

//
//  PositionRemoteEntityTests.swift
//  DataTests
//
//  Created by raulbot on 20/1/23.
//

import XCTest
@testable import Data
@testable import Tracker

final class PositionRemoteEntityTests: XCTestCase {
    func testTransformToDomain() {
        //Given
        let plateau = MockPlateauRemoteEntity.getPlateau()
        //Then
        let plateauDomain = plateau.transformToDomain()
        //When
        XCTAssertEqual(plateau.topRightCorner, plateauDomain.topRightCorner)
    }
    
    func testTransformToRemote() {
        //Given
        let plateau = MockPlateau.getPlateau()
        //Then
        let plateauRemote = plateau.transformToRemote()
        //When
        XCTAssertEqual(plateau.topRightCorner, plateauRemote.topRightCorner)
    }
}

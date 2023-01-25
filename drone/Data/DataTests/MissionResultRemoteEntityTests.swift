//
//  MissionResultRemoteEntityTests.swift
//  DataTests
//
//  Created by raulbot on 25/1/23.
//

import XCTest
@testable import Data
@testable import Tracker
import Domain

final class TrackerMissionResultTests: XCTestCase {
    func testTransformToDomain() {
        //Given
        let result = MockMissionResultRemoteEntity.getMissionResult()
        //Then
        let resultDomain = result.transformToDomain()
        //When
        XCTAssertNotNil(resultDomain)
        XCTAssertEqual(result.result.position.coordinate, resultDomain?.lastPosition.coordinate)
        XCTAssertEqual(result.result.position.direction.rawValue, resultDomain?.lastPosition.direction.rawValue)
        XCTAssertEqual(result.mission.plateau.topRightCorner, resultDomain?.mission.plateau.topRightCorner)
        XCTAssertEqual(result.mission.drone.currentPosition.direction.rawValue, resultDomain?.mission.drone.currentPosition.direction.rawValue)
        XCTAssertEqual(result.mission.drone.currentPosition.coordinate, resultDomain?.mission.drone.currentPosition.coordinate)
        XCTAssertEqual(resultDomain?.mission.instructions.instructions.count, 3)
        XCTAssertEqual(result.mission.instructions.instructions.count, resultDomain?.mission.instructions.instructions.count)
        XCTAssertEqual(result.mission.instructions.instructions[0].movement.rawValue, resultDomain?.mission.instructions.instructions[0].movement.rawValue)
        XCTAssertEqual(result.mission.instructions.instructions[1].movement.rawValue, resultDomain?.mission.instructions.instructions[1].movement.rawValue)
        XCTAssertEqual(result.mission.instructions.instructions[2].movement.rawValue, resultDomain?.mission.instructions.instructions[2].movement.rawValue)
        XCTAssertTrue(result.result.error == nil && resultDomain?.error == nil)
    }
}

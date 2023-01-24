//
//  MissionRemoteEntityTests.swift
//  DataTests
//
//  Created by raulbot on 20/1/23.
//

import XCTest
@testable import Data
@testable import Tracker

final class MissionRemoteEntityTests: XCTestCase {
    func testTransformToDomain() {
        //Given
        let mission = MockMissionRemoteEntity.getMission()
        //Then
        let missionDomain = mission.transformToDomain()
        //When
        XCTAssertNotNil(missionDomain)
        XCTAssertEqual(mission.drone.currentPosition.direction.rawValue, missionDomain?.drone.currentPosition.direction.rawValue)
        XCTAssertEqual(mission.drone.currentPosition.coordinate, missionDomain?.drone.currentPosition.coordinate)
        XCTAssertEqual(mission.plateau.topRightCorner, missionDomain?.plateau.topRightCorner)
        XCTAssertEqual(missionDomain?.instructions.instructions.count, 3)
        XCTAssertEqual(mission.instructions.instructions.count, missionDomain?.instructions.instructions.count)
        XCTAssertEqual(mission.instructions.instructions[0].movement.rawValue, missionDomain?.instructions.instructions[0].movement.rawValue)
        XCTAssertEqual(mission.instructions.instructions[1].movement.rawValue, missionDomain?.instructions.instructions[1].movement.rawValue)
        XCTAssertEqual(mission.instructions.instructions[2].movement.rawValue, missionDomain?.instructions.instructions[2].movement.rawValue)
    }
}

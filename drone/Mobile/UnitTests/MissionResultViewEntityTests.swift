//
//  MissionResultViewEntityTests.swift
//  droneTests
//
//  Created by raulbot on 26/1/23.
//

import XCTest
@testable import drone

final class MissionResultViewEntityTests: XCTestCase {
    func testTransformToUI() {
        //Given
        let missionResult = MockMissionResult.getMissionResult()
        //When
        let missionResultUI = missionResult.transformToUI()
        //Then
        XCTAssertEqual(missionResultUI.instructions.count, 3)
        XCTAssertEqual(missionResultUI.instructions.count, missionResult.mission.instructions.instructions.count)
        XCTAssertEqual(Array(missionResultUI.instructions)[0], "L")
        XCTAssertEqual(Array(missionResultUI.instructions)[1], "R")
        XCTAssertEqual(Array(missionResultUI.instructions)[2], "M")
        XCTAssertEqual(Array(missionResultUI.initialPosition).count, 5)
        XCTAssertEqual(Array(missionResultUI.initialPosition)[0], "0")
        XCTAssertEqual(Array(missionResultUI.initialPosition)[2], "0")
        XCTAssertEqual(Array(missionResultUI.initialPosition)[4], "N")
    }
}

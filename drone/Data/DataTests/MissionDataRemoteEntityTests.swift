//
//  MissionDataRemoteEntityTests.swift
//  DataTests
//
//  Created by raulbot on 20/1/23.
//

import XCTest
@testable import Data

final class MissionDataRemoteEntityTests: XCTestCase {
    func testTransformMissionRemoteEntitySUCCESS() {
        //Given
        let missionData = MockMissionDataRemoteEntity.getMissionDataNOError()
        //When
        let mission = missionData.transformToMissionRemoteEntity()
        //Then
        XCTAssertNotNil(mission)
    }
    
    func testTransformMissionRemoteEntityRoverPositionERROR() {
        //Given
        let missionData = MockMissionDataRemoteEntity.getMissionDataRoverPositionERROR()
        //When
        let mission = missionData.transformToMissionRemoteEntity()
        //Then
        XCTAssertNil(mission)
    }
    
    func testTransformMissionRemoteEntityPlateauERROR() {
        //Given
        let missionData = MockMissionDataRemoteEntity.getMissionDataTopRightCornerERROR()
        //When
        let mission = missionData.transformToMissionRemoteEntity()
        //Then
        XCTAssertNil(mission)
    }
    
    func testTransformMissionRemoteEntityMovementsERROR() {
        //Given
        let missionData = MockMissionDataRemoteEntity.getMissionDataMovementsERROR()
        //When
        let mission = missionData.transformToMissionRemoteEntity()
        //Then
        XCTAssertNil(mission)
    }
    
    func testsTransformToRoverPositionSUCCESS() {
        //Given
        let missionData = MockMissionDataRemoteEntity.getMissionDataNOError()
        //When
        let position = missionData.transformToRoverPosition()
        //Then
        XCTAssertNotNil(position)
    }
    
    func testsTransformToRoverPositionLowercaseSUCCESS() {
        //Given
        let missionData = MockMissionDataRemoteEntity.getMissionDataRoverPositionLOWERCASE()
        //When
        let position = missionData.transformToRoverPosition()
        //Then
        XCTAssertNotNil(position)
    }

    func testsTransformToRoverPositionERROR() {
        //Given
        let missionData = MockMissionDataRemoteEntity.getMissionDataRoverPositionERROR()
        //When
        let position = missionData.transformToRoverPosition()
        //Then
        XCTAssertNil(position)
    }
    
    func testsTransformToPlateauSUCCESS() {
        //Given
        let missionData = MockMissionDataRemoteEntity.getMissionDataNOError()
        //When
        let plateau = missionData.transformToPlateau()
        //Then
        XCTAssertNotNil(plateau)
    }
    
    func testsTransformToPlateauERROR() {
        //Given
        let missionData = MockMissionDataRemoteEntity.getMissionDataTopRightCornerERROR()
        //When
        let plateau = missionData.transformToPlateau()
        //Then
        XCTAssertNil(plateau)
    }
    
    func testsTransformToInstructionsSUCCESS() {
        //Given
        let missionData = MockMissionDataRemoteEntity.getMissionDataNOError()
        //When
        let instructions = missionData.transformToInstructions()
        //Then
        XCTAssertNotNil(instructions)
    }
    
    func testsTransformToInstructionsLowercaseSUCCESS() {
        //Given
        let missionData = MockMissionDataRemoteEntity.getMissionDataMovementsLOWERCASE()
        //When
        let instructions = missionData.transformToInstructions()
        //Then
        XCTAssertNotNil(instructions)
    }
    
    func testsTransformToInstructionsERROR() {
        //Given
        let missionData = MockMissionDataRemoteEntity.getMissionDataMovementsERROR()
        //When
        let instructions = missionData.transformToInstructions()
        //Then
        XCTAssertNil(instructions)
    }
}

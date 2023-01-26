//
//  MissionResultViewModelTests.swift
//  droneTests
//
//  Created by raulbot on 25/1/23.
//

import XCTest
@testable import drone

final class MissionResultViewModelTests: XCTestCase {
    
    static let errorDescriptionDefault = "errorDescriptionDefault"
    
    func testGetInitialPositionTextSUCCESS() {
        //Given
        let viewmodel = MissionResultViewModel(executeMissionUseCase: MockExecuteMission.getUseCase())
        viewmodel.missionResult = MockMissionResultViewEntity.getMissionResult()
        //When
        let text = viewmodel.getInitialPositionText()
        //Then
        XCTAssertEqual(text, MockMissionResultViewEntity.initialPositionDefault)
    }
    
    func testGetInitialPositionTextNODATA() {
        //Given
        let viewmodel = MissionResultViewModel(executeMissionUseCase: MockExecuteMission.getUseCase())
        //When
        let text = viewmodel.getInitialPositionText()
        //Then
        XCTAssertEqual(text, MissionResultViewModel.noDataText)
    }
    
    func testGetPlateauTextSUCCESS() {
        //Given
        let viewmodel = MissionResultViewModel(executeMissionUseCase: MockExecuteMission.getUseCase())
        viewmodel.missionResult = MockMissionResultViewEntity.getMissionResult()
        //When
        let text = viewmodel.getPlateauText()
        //Then
        XCTAssertEqual(text, MockMissionResultViewEntity.plateauDefault)
    }
    
    func testGetPlateauTextNODATA() {
        //Given
        let viewmodel = MissionResultViewModel(executeMissionUseCase: MockExecuteMission.getUseCase())
        //When
        let text = viewmodel.getPlateauText()
        //Then
        XCTAssertEqual(text, MissionResultViewModel.noDataText)
    }

    func testGetInstructionsTextSUCCESS() {
        //Given
        let viewmodel = MissionResultViewModel(executeMissionUseCase: MockExecuteMission.getUseCase())
        viewmodel.missionResult = MockMissionResultViewEntity.getMissionResult()
        //When
        let text = viewmodel.getInstructionsText()
        //Then
        XCTAssertEqual(text, MockMissionResultViewEntity.instructionsDefault)
    }
    
    func testGetInstructionsTextNODATA() {
        //Given
        let viewmodel = MissionResultViewModel(executeMissionUseCase: MockExecuteMission.getUseCase())
        //When
        let text = viewmodel.getInstructionsText()
        //Then
        XCTAssertEqual(text, MissionResultViewModel.noDataText)
    }
    
    func testGetResultTextSUCCESS() {
        //Given
        let viewmodel = MissionResultViewModel(executeMissionUseCase: MockExecuteMission.getUseCase())
        viewmodel.missionResult = MockMissionResultViewEntity.getMissionResult()
        viewmodel.errorDescription = ErrorDescription(text: MissionResultViewModelTests.errorDescriptionDefault)
        //When
        let text = viewmodel.getResultText()
        //Then
        XCTAssertEqual(text, MockMissionResultViewEntity.resultDefault)
    }
    
    func testGetResultTextERROR() {
        //Given
        let viewmodel = MissionResultViewModel(executeMissionUseCase: MockExecuteMission.getUseCase())
        viewmodel.errorDescription = ErrorDescription(text: MissionResultViewModelTests.errorDescriptionDefault)
        //When
        let text = viewmodel.getResultText()
        //Then
        XCTAssertEqual(text, MissionResultViewModelTests.errorDescriptionDefault)
    }
    
    func testGetResultTextNODATA() {
        //Given
        let viewmodel = MissionResultViewModel(executeMissionUseCase: MockExecuteMission.getUseCase())
        //When
        let text = viewmodel.getResultText()
        //Then
        XCTAssertEqual(text, "")
    }
    
    func testExecuteMissionSUCCESS() {
        //Given
        let useCase = MockExecuteMission.getUseCase()
        useCase.response = .success
        let viewmodel = MissionResultViewModel(executeMissionUseCase: useCase)
        //When
        viewmodel.executeMissionButtonPressed()
        //Then
        XCTAssertTrue(useCase.called)
        XCTAssertNotNil(viewmodel.missionResult)
        XCTAssertNil(viewmodel.errorDescription)
    }
    
    func testExecuteMissionERROR() {
        //Given
        let useCase = MockExecuteMission.getUseCase()
        useCase.response = .error
        let viewmodel = MissionResultViewModel(executeMissionUseCase: useCase)
        //When
        viewmodel.executeMissionButtonPressed()
        //Then
        XCTAssertTrue(useCase.called)
        XCTAssertNil(viewmodel.missionResult)
        XCTAssertNotNil(viewmodel.errorDescription)
    }
}

//
//  MissionDataRepositoryTests.swift
//  DataTests
//
//  Created by raulbot on 20/1/23.
//

import XCTest
import Combine
@testable import Data
import Domain

final class MissionDataRepositoryTests: XCTestCase {
    func testGetMissionInfoSUCCESS() {
        // Given
        let dataSource = MockMissionRemotelDataSource()
        dataSource.response = .success
        let missionRepository = MissionDataRepository(remoteDataSource: dataSource)
        let expectation = expectation(description: "testGetMissionInfoSUCCESS")
        var response: DataSourceResponse?
        // When
        missionRepository.getMissionInfo().sink { completion in
            switch completion {
            case .failure:
                response = .error
            case .finished:
                response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        // Then
        XCTAssertTrue(dataSource.called)
        XCTAssertEqual(response, .success)
    }

    func testGetMissionInfoERROR() {
        // Given
        let dataSource = MockMissionRemotelDataSource()
        dataSource.response = .error
        let missionRepository = MissionDataRepository(remoteDataSource: dataSource)
        let expectation = expectation(description: "test_GetMissionInfo_ERROR")
        var response: DataSourceResponse?
        // When
        missionRepository.getMissionInfo().sink { completion in
            switch completion {
            case .failure:
                response = .error
            case .finished:
                response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        // Then
        XCTAssertTrue(dataSource.called)
        XCTAssertEqual(response, .error)
    }
    
    func testGetMissionResultSUCCESS() {
        // Given
        let mission = MockMission.getMission()
        let dataSource = MockMissionRemotelDataSource()
        dataSource.response = .success
        let missionRepository = MissionDataRepository(remoteDataSource: dataSource)
        let expectation = expectation(description: "test_GetMissionResult_SUCCESS")
        var response: DataSourceResponse?
        // When
        missionRepository.getMissionResult(mission).sink { completion in
            switch completion {
            case .failure:
                response = .error
            case .finished:
                response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        // Then
        XCTAssertTrue(dataSource.called)
        XCTAssertEqual(response, .success)
    }
    
    func testGetMissionResultERROR() {
        // Given
        let mission = MockMission.getMission()
        let dataSource = MockMissionRemotelDataSource()
        dataSource.response = .error
        let missionRepository = MissionDataRepository(remoteDataSource: dataSource)
        let expectation = expectation(description: "test_GetMissionResult_ERROR")
        var response: DataSourceResponse?
        // When
        missionRepository.getMissionResult(mission).sink { completion in
            switch completion {
            case .failure:
                response = .error
            case .finished:
                response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        // Then
        XCTAssertTrue(dataSource.called)
        XCTAssertEqual(response, .error)
    }
}

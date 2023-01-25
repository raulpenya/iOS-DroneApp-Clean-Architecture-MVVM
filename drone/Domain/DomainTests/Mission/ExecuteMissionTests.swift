//
//  ExecuteMissionTests.swift
//  drone
//
//  Created by raulbot on 20/1/23.
//

import XCTest
@testable import Domain
import Combine

final class ExecuteMissionTests: XCTestCase {
    func testExecuteMissionSUCCESS() {
        //Given
        let repository = MockMissionRepository()
        repository.getMissionInfoResponse = .success
        repository.getMissionResultResponse = .success
        let usecase = ExecuteMission(repository: repository)
        var response: RepositoryResponse?
        let expectation = expectation(description: "testGetMissionInfoSUCCESS")
        //When
        usecase.execute(ExecuteMissionRequestValues()).sink { completion in
            print(completion)
            switch completion {
            case .failure:
                response = .error
            case .finished:
                response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertTrue(repository.getMissionInfoCalled)
        XCTAssertTrue(repository.getMissionResultCalled)
        XCTAssertEqual(response, .success)
    }
    
    func testExecuteMissionGetMissionInfoERROR() {
        //Given
        let repository = MockMissionRepository()
        repository.getMissionInfoResponse = .error
        repository.getMissionResultResponse = .success
        let usecase = ExecuteMission(repository: repository)
        var response: RepositoryResponse?
        let expectation = expectation(description: "testExecuteMissionGetMissionInfoERROR")
        //When
        usecase.execute(ExecuteMissionRequestValues()).sink { completion in
            print(completion)
            switch completion {
            case .failure:
                response = .error
            case .finished:
                response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertTrue(repository.getMissionInfoCalled)
        XCTAssertFalse(repository.getMissionResultCalled)
        XCTAssertEqual(response, .error)
    }
    
    func testExecuteMissionGetMissionResultERROR() {
        //Given
        let repository = MockMissionRepository()
        repository.getMissionInfoResponse = .success
        repository.getMissionResultResponse = .error
        let usecase = ExecuteMission(repository: repository)
        var response: RepositoryResponse?
        let expectation = expectation(description: "testExecuteMissionGetMissionResultERROR")
        //When
        usecase.execute(ExecuteMissionRequestValues()).sink { completion in
            print(completion)
            switch completion {
            case .failure:
                response = .error
            case .finished:
                response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertTrue(repository.getMissionInfoCalled)
        XCTAssertTrue(repository.getMissionResultCalled)
        XCTAssertEqual(response, .error)
    }
}

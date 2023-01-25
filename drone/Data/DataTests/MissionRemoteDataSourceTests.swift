//
//  MissionRemoteDataSourceTests.swift
//  DataTests
//
//  Created by raulbot on 25/1/23.
//

import XCTest
import Tracker
import Combine
@testable import Data
import Domain

final class MissionRemoteDataSourceTests: XCTestCase {
    func testGetInfoFromFileSUCCESS() {
        //Given
        let datasource = MissionRemoteDataSource()
        let fileLoader = FileLoader()
        let filename = MissionRemoteDataSource.fileName
        var result: MissionDataRemoteEntity?
        var resultError: Error?
        //When
        do {
            result = try datasource.getInfoFromFile(filename, fileLoader: fileLoader)
        } catch {
            resultError = error
        }
        //Then
        XCTAssertNotNil(result)
        XCTAssertNil(resultError)
    }

    func testGetInfoFromFileERROR() {
        //Given
        let datasource = MissionRemoteDataSource()
        let fileLoader = FileLoader()
        let filename = "XXXX"
        var result: MissionDataRemoteEntity?
        var resultError: Error?
        //When
        do {
            result = try datasource.getInfoFromFile(filename, fileLoader: fileLoader)
        } catch {
            resultError = error
        }
        //Then
        XCTAssertNil(result)
        XCTAssertNotNil(resultError)
    }
    
    func testGetResultFromTrackerSUCCESS() {
        //Given
        let datasource = MissionRemoteDataSource()
        let mission = MockMissionRemoteEntity.getMission()
        //When
        let result = datasource.getResultFromTracker(mission: mission)
        //Then
        XCTAssertEqual(mission.drone.currentPosition.coordinate, result.mission.drone.currentPosition.coordinate)
        XCTAssertEqual(mission.drone.currentPosition.direction.rawValue, result.mission.drone.currentPosition.direction.rawValue)
        XCTAssertEqual(mission.plateau.topRightCorner, result.mission.plateau.topRightCorner)
        XCTAssertEqual(mission.plateau.letfBottomCorner, result.mission.plateau.letfBottomCorner)
        XCTAssertEqual(mission.instructions.instructions.count, result.mission.instructions.instructions.count)
        XCTAssertEqual(mission.instructions.instructions[0].movement.rawValue, result.mission.instructions.instructions[0].movement.rawValue)
        XCTAssertEqual(mission.instructions.instructions[1].movement.rawValue, result.mission.instructions.instructions[1].movement.rawValue)
        XCTAssertEqual(mission.instructions.instructions[2].movement.rawValue, result.mission.instructions.instructions[2].movement.rawValue)
        XCTAssertNil(result.result.error)
        XCTAssertTrue(result.result.success)
    }
    
    func testGetResultFromTrackerERRORIntialPosition() {
        //Given
        let datasource = MissionRemoteDataSource()
        let mission = MockMissionRemoteEntity.getMissionWithWRONGInitialPosition()
        //When
        let result = datasource.getResultFromTracker(mission: mission)
        //Then
        XCTAssertEqual(mission.drone.currentPosition.coordinate, result.mission.drone.currentPosition.coordinate)
        XCTAssertEqual(mission.drone.currentPosition.direction.rawValue, result.mission.drone.currentPosition.direction.rawValue)
        XCTAssertEqual(mission.plateau.topRightCorner, result.mission.plateau.topRightCorner)
        XCTAssertEqual(mission.plateau.letfBottomCorner, result.mission.plateau.letfBottomCorner)
        XCTAssertEqual(mission.instructions.instructions.count, result.mission.instructions.instructions.count)
        XCTAssertEqual(mission.instructions.instructions[0].movement.rawValue, result.mission.instructions.instructions[0].movement.rawValue)
        XCTAssertEqual(mission.instructions.instructions[1].movement.rawValue, result.mission.instructions.instructions[1].movement.rawValue)
        XCTAssertEqual(mission.instructions.instructions[2].movement.rawValue, result.mission.instructions.instructions[2].movement.rawValue)
        XCTAssertNotNil(result.result.error)
        XCTAssertEqual((result.result.error as! TrackerErrors).code, TrackerErrors.initialPositionOutOfBounds.code)
        XCTAssertEqual((result.result.error as! TrackerErrors).localizedDescription, TrackerErrors.initialPositionOutOfBounds.localizedDescription)
        XCTAssertFalse(result.result.success)
    }
    
    func testGetResultFromTrackerERROROutOfBounds() {
        //Given
        let datasource = MissionRemoteDataSource()
        let mission = MockMissionRemoteEntity.getMissionWithInstructionsOUTOFBOUNDS()
        //When
        let result = datasource.getResultFromTracker(mission: mission)
        //Then
        XCTAssertEqual(mission.drone.currentPosition.coordinate, result.mission.drone.currentPosition.coordinate)
        XCTAssertEqual(mission.drone.currentPosition.direction.rawValue, result.mission.drone.currentPosition.direction.rawValue)
        XCTAssertEqual(mission.plateau.topRightCorner, result.mission.plateau.topRightCorner)
        XCTAssertEqual(mission.plateau.letfBottomCorner, result.mission.plateau.letfBottomCorner)
        XCTAssertEqual(mission.instructions.instructions.count, result.mission.instructions.instructions.count)
        XCTAssertEqual(mission.instructions.instructions[0].movement.rawValue, result.mission.instructions.instructions[0].movement.rawValue)
        XCTAssertEqual(mission.instructions.instructions[1].movement.rawValue, result.mission.instructions.instructions[1].movement.rawValue)
        XCTAssertEqual(mission.instructions.instructions[2].movement.rawValue, result.mission.instructions.instructions[2].movement.rawValue)
        XCTAssertNotNil(result.result.error)
        XCTAssertEqual((result.result.error as! TrackerErrors).code, TrackerErrors.instructionOutOfBounds.code)
        XCTAssertEqual((result.result.error as! TrackerErrors).localizedDescription, TrackerErrors.instructionOutOfBounds.localizedDescription)
        XCTAssertFalse(result.result.success)
    }
    
    func testGetMissionInfoSUCCESS() {
        //Given
        let datasource = MockMissionRemoteDataSource()
        datasource.getInfoFromFileResponse = .success
        let expectation = expectation(description: "testGetMissionInfoSUCCESS")
        var response: DataSourceResponse?
        var errorResponse: Error?
        //When
        datasource.getMissionInfo().sink { completion in
            switch completion {
            case .failure(let error):
                errorResponse = error
                response = .error
            case .finished:
                response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertTrue(datasource.getInfoFromFileCalled)
        XCTAssertEqual(response, .success)
        XCTAssertNil(errorResponse)
    }
    
    func testGetMissionInfoERROR() {
        //Given
        let datasource = MockMissionRemoteDataSource()
        datasource.getInfoFromFileResponse = .error
        let expectation = expectation(description: "testGetMissionInfoERROR")
        var response: DataSourceResponse?
        var errorResponse: Error?
        //When
        datasource.getMissionInfo().sink { completion in
            switch completion {
            case .failure(let error):
                errorResponse = error
                response = .error
            case .finished:
                response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertTrue(datasource.getInfoFromFileCalled)
        XCTAssertEqual(response, .error)
        XCTAssertEqual((errorResponse as! RepositoryErrors).code, RepositoryErrors.jsonError.code)
        XCTAssertEqual((errorResponse as! RepositoryErrors).localizedDescription, RepositoryErrors.jsonError.localizedDescription)
    }
    
    func testGetMissionInfoOutputDataException() {
        //Given
        let datasource = MockMissionRemoteDataSource()
        datasource.getInfoFromFileResponse = .outputDataException
        let expectation = expectation(description: "testGetMissionInfoOutputDataException")
        var response: DataSourceResponse?
        var errorResponse: Error?
        //When
        datasource.getMissionInfo().sink { completion in
            switch completion {
            case .failure(let error):
                errorResponse = error
                response = .error
            case .finished:
                response = .success
            }
            expectation.fulfill()
        } receiveValue: { _ in }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertTrue(datasource.getInfoFromFileCalled)
        XCTAssertEqual(response, .error)
        XCTAssertEqual((errorResponse as! RepositoryErrors).code, RepositoryErrors.jsonError.code)
        XCTAssertEqual((errorResponse as! RepositoryErrors).localizedDescription, RepositoryErrors.jsonError.localizedDescription)
    }
    
    
    
    func testGetMissionResultSUCCESS() {
        //Given
        let datasource = MissionRemoteDataSource()
        let mission = MockMission.getMission()
        let expectation = expectation(description: "testGetMissionResultSUCCESS")
        var response: DataSourceResponse?
        var errorResponse: Error?
        var missionResult: MissionResult?
        //When
        datasource.getMissionResult(mission).sink { completion in
            switch completion {
            case .failure(let error):
                errorResponse = error
                response = .error
            case .finished:
                response = .success
            }
            expectation.fulfill()
        } receiveValue: { result in
            missionResult = result
        }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .success)
        XCTAssertNil(missionResult?.error)
    }
    
    func testGetMissionResultERRORInitialPosition() {
        //Given
        let datasource = MissionRemoteDataSource()
        let mission = MockMission.getMissionWithWRONGInitialPosition()
        let expectation = expectation(description: "testGetMissionResultERRORInitialPosition")
        var response: DataSourceResponse?
        var errorResponse: Error?
        var missionResult: MissionResult?
        //When
        datasource.getMissionResult(mission).sink { completion in
            switch completion {
            case .failure(let error):
                errorResponse = error
                response = .error
            case .finished:
                response = .success
            }
            expectation.fulfill()
        } receiveValue: { result in
            missionResult = result
        }.cancel()
        waitForExpectations(timeout: 5, handler: nil)
        //Then
        XCTAssertEqual(response, .success)
        XCTAssertNil(missionResult?.error)
    }
    
    class MockMissionRemoteDataSource: MissionRemoteDataSource {
        enum GetInfoFromFileResponse {
            case success
            case error
            case outputDataException
        }
        
        var getInfoFromFileCalled: Bool = false
        var getInfoFromFileResponse: GetInfoFromFileResponse = .success
        
        override func getInfoFromFile(_ filename: String = MissionRemoteDataSource.fileName, fileLoader: FileLoader = FileLoader()) throws -> MissionDataRemoteEntity {
            getInfoFromFileCalled = true
            switch getInfoFromFileResponse {
            case .success:
                return MockMissionDataRemoteEntity.getMissionDataNOError()
            case .error:
                throw RepositoryErrors.jsonError as Error
            case .outputDataException:
                return MockMissionDataRemoteEntity.getMissionDataTopRightCornerERROR()
            }
        }
    }
}

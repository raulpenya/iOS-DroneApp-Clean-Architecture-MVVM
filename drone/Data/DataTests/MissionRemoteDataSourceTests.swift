//
//  MissionRemoteDataSourceTests.swift
//  DataTests
//
//  Created by raulbot on 25/1/23.
//

import XCTest
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
    
    func testGetMissionResultSUCCESS() {
        //Given
        let datasource = MissionRemoteDataSource()
        let mission = MockMissionRemoteEntity.getMission()
        //When
        let result = datasource.getResultFromTracket(mission: mission)
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
    
    func testGetMissionResultERROR() {
        
    }
    
//    class MockMissionRemoteDataSource: MissionRemoteDataSource {
//        override func getInfoFromFile(_ filename: String = MissionRemoteDataSource.fileName, fileLoader: FileLoader = FileLoader()) throws -> MissionDataRemoteEntity {
//            <#code#>
//        }
//
//        override func getMissionResult(_ mission: Mission) -> AnyPublisher<MissionResult, Error> {
//            <#code#>
//        }
//    }
}

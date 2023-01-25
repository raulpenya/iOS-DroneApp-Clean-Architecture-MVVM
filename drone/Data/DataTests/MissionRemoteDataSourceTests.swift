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
}

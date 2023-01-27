//
//  FileLoaderTests.swift
//  DataTests
//
//  Created by raulbot on 25/1/23.
//

import XCTest
@testable import Data

final class FileLoaderTests: XCTestCase {
    func testLoadJsonSUCCESS() {
        //Given
        let fileLoader = FileLoader()
        let fileName = MissionRemoteDataSource.fileName
        var data: Data?
        var loaderError: Error?
        //When
        do {
            data = try fileLoader.loadJson(filename: fileName)
        } catch {
            loaderError = error
        }
        //Then
        XCTAssertNotNil(data)
        XCTAssertNil(loaderError)
    }

    func testLoadJsonFileNotFound() {
        //Given
        let fileLoader = FileLoader()
        let fileName = "XXXX"
        var data: Data?
        var loaderError: Error?
        //When
        do {
            data = try fileLoader.loadJson(filename: fileName)
        } catch {
            loaderError = error
        }
        //Then
        XCTAssertNil(data)
        XCTAssertNil(loaderError)
    }
}

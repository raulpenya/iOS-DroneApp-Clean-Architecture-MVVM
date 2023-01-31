//
//  SnapshotsUITests.swift
//  droneUITests
//
//  Created by raulbot on 31/1/23.
//

import XCTest

final class SnapshotsUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGenerateScreenshots() throws {
        snapshot("MissionResult")
        let setCustomMissionParamsButton = app.buttons["set custom mission params"]
        setCustomMissionParamsButton.tap()
        snapshot("MissionEditor")
        let dismissButton = app.navigationBars["MissionEditor"]/*@START_MENU_TOKEN@*/.buttons["Dismiss"]/*[[".otherElements[\"Dismiss\"].buttons[\"Dismiss\"]",".buttons[\"Dismiss\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        dismissButton.tap()
        app.buttons["Execute mission"].tap()
    }
}

//
//  MockMissionResultRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 26/1/23.
//

import Foundation
@testable import Data
@testable import Tracker

struct MockMissionResultRemoteEntity: TrackerMissionResult {
    var mission: TrackerMission
    var result: TrackerResult
    
    static func getMissionResult() -> TrackerMissionResult {
        return MockMissionResultRemoteEntity(mission: MockMissionRemoteEntity.getMission(), result: MockTrackerResult.getTrackerResult())
    }
}

struct MockTrackerResult {
    static func getTrackerResult() -> TrackerResult {
        return Result(success: true, position: MockPositionRemoteEntity.getPosition())
    }
}

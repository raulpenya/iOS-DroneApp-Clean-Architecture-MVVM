//
//  MockMissionResult.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation
@testable import Data
@testable import Tracker
@testable import Domain

struct MockMissionResultRemoteEntity: TrackerMissionResult {
    var mission: TrackerMission
    var result: TrackerResult
    
    static func getMissionResult() -> TrackerMissionResult {
        return MockMissionResultRemoteEntity(mission: MockMissionRemoteEntity.getMission(), result: MockTrackerResult.getTrackerResult())
    }
}

struct MockTrackerResult {
    static func getTrackerResult() -> Result {
        return Result(success: true, position: MockPositionRemoteEntity.getPosition())
    }
}

struct MockMissionResult {
    static func getMissionResult() -> Domain.MissionResult {
        return MissionResult(mission: MockMission.getMission(), lastPosition: MockPosition.getPosition(), error: nil)
    }
}

//
//  MockMissionResult.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation
import Domain

struct MockMissionResult {
    static func getMissionResult() -> Domain.MissionResult {
        return MissionResult(mission: MockMission.getMission(), lastPosition: MockPosition.getPosition(), error: nil)
    }
}

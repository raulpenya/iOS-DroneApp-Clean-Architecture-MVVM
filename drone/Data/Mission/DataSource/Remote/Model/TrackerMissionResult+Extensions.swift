//
//  TrackerMissionResult+Extensions.swift
//  Data
//
//  Created by raulbot on 25/1/23.
//

import Foundation
import Tracker
import Domain

extension TrackerMissionResult {
    func transformToDomain() -> MissionResult? {
        guard let mission = mission.transformToDomain(), let position = result.position.transformToDomain() else { return nil }
        return MissionResult(mission: mission, lastPosition: position, error: result.error)
    }
}

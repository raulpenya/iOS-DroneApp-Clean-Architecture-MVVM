//
//  MissionResultRemoteEntity.swift
//  Data
//
//  Created by raulbot on 20/1/23.
//

import Foundation
import Tracker
import Domain

struct MissionResultRemoteEntity: TrackerMissionResult {
    var mission: TrackerMission
    var result: TrackerResult
}

extension MissionResultRemoteEntity {
    func transformToDomain() -> MissionResult? {
        guard let mission = mission.transformToDomain(), let position = result.position.transformToDomain() else { return nil }
        return MissionResult(mission: mission, lastPosition: position, error: result.error)
    }
}

extension TrackerMissionResult {
    func transformToRemote() -> MissionResultRemoteEntity {
        return MissionResultRemoteEntity(mission: mission, result: result)
    }
}

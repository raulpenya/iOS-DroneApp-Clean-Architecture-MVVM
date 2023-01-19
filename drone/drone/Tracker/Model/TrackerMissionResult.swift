//
//  TrackerMissionResult.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

public protocol TrackerResult {
    var success: Bool { get set }
    var position: TrackerPosition { get set }
    var error: Error? { get set }
}

class Result: TrackerResult {
    var success: Bool
    var position: TrackerPosition
    var error: Error?
    
    init(success: Bool, position: TrackerPosition, error: Error? = nil) {
        self.success = success
        self.position = position
        self.error = error
    }
}

public protocol TrackerMissionResult {
    var mission: TrackerMission { get set }
    var result: TrackerResult { get set }
}

class MissionResult: TrackerMissionResult {
    var mission: TrackerMission
    var result: TrackerResult
    
    init(mission: TrackerMission, result: TrackerResult) {
        self.mission = mission
        self.result = result
    }
}

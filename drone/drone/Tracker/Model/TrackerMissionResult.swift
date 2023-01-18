//
//  TrackerMissionResult.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

protocol TrackerResult {
    var success: Bool { get set }
    var error: Error? { get set }
}

class Result: TrackerResult {
    var success: Bool
    var error: Error?
    
    init(success: Bool, error: Error? = nil) {
        self.success = success
        self.error = error
    }
}

protocol TrackerMissionResult {
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

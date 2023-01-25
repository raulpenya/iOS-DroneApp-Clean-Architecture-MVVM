//
//  Ttracker.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

public class Tracker {
    public init() {}
    public func getResult(from mission: TrackerMission) -> TrackerMissionResult {
        return calculatePath(with: mission)
    }
}

internal extension Tracker { // private methods
    func calculatePath(with mission: TrackerMission) -> TrackerMissionResult {
        let instructions = mission.instructions
        var drone = mission.drone
        let plateau = mission.plateau
        var success = false
        var error: Error? = nil
        if isInitialPositionInBoundaries(drone.currentPosition, in: plateau) {
            for instruction in instructions.instructions {
                let newDrone = execute(instruction: instruction, with: drone)
                success = isPositionInBoundaries(newDrone.currentPosition, in: plateau)
                if !success {
                    error = TrackerErrors.instructionOutOfBounds as Error
                    break
                }
                drone = newDrone
            }
        } else {
            error = TrackerErrors.initialPositionOutOfBounds //as Error
        }
        let result = Result(success: success, position: drone.currentPosition, error: error)
        return MissionResult(mission: mission, result: result)
    }
    
    func isInitialPositionInBoundaries(_ position: TrackerPosition, in plateau: TrackerPlateau) -> Bool {
        return isPositionInBoundaries(position, in: plateau)
    }
    
    func isPositionInBoundaries(_ position: TrackerPosition, in plateau: TrackerPlateau) -> Bool {
        return plateau.isPositionWithinTheBoundaries(position.coordinate)
    }
    
    func execute(instruction: TrackerInstruction, with drone: TrackerDrone) -> TrackerDrone {
        return drone.execute(movement: instruction.movement)
    }
}

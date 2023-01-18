//
//  Ttracker.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

enum TrackerErrors: Int, Error {
    case instructionOutOfBounds = 700
    var localizedDescription: String {
        switch self {
        case .instructionOutOfBounds:
            return "TrackerErrors :: Instruction Out Of Bounds"
        }
    }
    var code: Int { return rawValue }
}

class Tracker {
    func getResult(from mission: TrackerMission) -> TrackerMissionResult {
        return calculatePath(with: mission)
    }
}

extension Tracker { // private methods
    private func calculatePath(with mission: TrackerMission) -> TrackerMissionResult {
        let instructions = mission.instructions
        var drone = mission.drone
        let plateau = mission.plateau
        var success = false
        var error: Error? = nil
        for instruction in instructions.instructions {
            let newDrone = execute(instruction: instruction, with: drone)
            success = checkDronePosition(newDrone.currentPosition, in: plateau)
            if !success {
                error = NSError(domain: TrackerErrors.instructionOutOfBounds.localizedDescription,
                                code: TrackerErrors.instructionOutOfBounds.code,
                                userInfo: nil)
                break
            }
            drone = newDrone
        }
        let result = Result(success: success, error: error)
        return MissionResult(mission: mission, result: result)
        
    }
    
    private func execute(instruction: TrackerInstruction, with drone: TrackerDrone) -> TrackerDrone {
        return drone.execute(movement: instruction.movement)
    }
    
    private func checkDronePosition(_ position: TrackerPosition, in plateau: TrackerPlateau) -> Bool {
        return plateau.isPositionWithinTheBoundaries(position.coordinate)
    }
}

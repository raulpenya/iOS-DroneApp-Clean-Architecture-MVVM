//
//  InstructionsRemoteEntity.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker

struct InstructionsRemoteEntity: TrackerInstructions {
    var instructions: [TrackerInstruction]
}

struct InstructionRemoteEntity: TrackerInstruction {
    var movement: TrackerMovement
}

extension MissionDataRemoteEntity {
    func transformToInstructions() -> TrackerInstructions {
        let instructions = Array(movements).compactMap { String($0) }.compactMap { TrackerMovement.createMovement($0) }.compactMap { InstructionRemoteEntity(movement: $0) }
        return InstructionsRemoteEntity(instructions: instructions)
    }
}

extension TrackerMovement {
    static func createMovement(_ movement: String) -> TrackerMovement? {
        var newMovement: TrackerMovement? = nil
        switch movement {
        case "R":
            newMovement = .right
        case "L":
            newMovement = .left
        case "M":
            newMovement = .forward
        default:
            assert(false, "TrackerMovement :: createMovement :: wrong instruction")
            break
        }
        return newMovement
    }
}

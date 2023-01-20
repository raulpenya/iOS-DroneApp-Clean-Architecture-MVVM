//
//  InstructionsRemoteEntity.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker
import Domain

struct InstructionsRemoteEntity: TrackerInstructions {
    var instructions: [TrackerInstruction]
}

extension TrackerInstructions {
    func transformToDomain() -> Instructions? {
        let instructionsDomain = instructions.compactMap { $0.transformToDomain() }
        guard instructions.count == instructionsDomain.count else { return nil }
        return Instructions(instructions: instructionsDomain)
    }
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

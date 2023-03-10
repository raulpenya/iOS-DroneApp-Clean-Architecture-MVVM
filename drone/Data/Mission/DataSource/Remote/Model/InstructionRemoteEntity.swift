//
//  InstructionRemoteEntity.swift
//  Data
//
//  Created by raulbot on 20/1/23.
//

import Foundation
import Tracker
import Domain

struct InstructionRemoteEntity: TrackerInstruction {
    var movement: TrackerMovement
}

extension TrackerInstruction {
    func transformToDomain() -> Instruction? {
        guard let movement = Movement(rawValue: movement.rawValue) else { return nil }
        return Instruction(movement: movement)
    }
}

extension Instruction {
    func transformToRemote() -> TrackerInstruction? {
        guard let movement = TrackerMovement(rawValue: movement.rawValue) else { return nil }
        return InstructionRemoteEntity(movement: movement)
    }
}

extension TrackerMovement {
    static func createMovement(with string: String) -> TrackerMovement? {
        var newMovement: TrackerMovement? = nil
        switch string.uppercased() {
        case "R":
            newMovement = .right
        case "L":
            newMovement = .left
        case "M":
            newMovement = .forward
        default:
            break
        }
        return newMovement
    }
}

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

extension Instructions {
    func transformToRemote() -> TrackerInstructions? {
        let instructionsRemote = instructions.compactMap { $0.transformToRemote() }
        guard instructions.count == instructionsRemote.count else { return nil }
        return InstructionsRemoteEntity(instructions: instructionsRemote)
    }
}

//
//  MockInstructionsRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation
@testable import Data
@testable import Tracker

struct MockInstructionsRemoteEntity {
    static func getInstructions() -> TrackerInstructions {
        return InstructionsRemoteEntity(instructions: [MockInstructionRemoteEntity.getInstructionLeft(),MockInstructionRemoteEntity.getInstructionRight(),MockInstructionRemoteEntity.getInstructionForward()])
    }
}

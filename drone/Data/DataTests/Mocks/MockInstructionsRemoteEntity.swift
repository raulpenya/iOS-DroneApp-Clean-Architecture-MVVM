//
//  MockInstructionsRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 26/1/23.
//

import Foundation
@testable import Data
import Tracker

struct MockInstructionsRemoteEntity {
    static func getInstructions() -> TrackerInstructions {
        return InstructionsRemoteEntity(instructions: [MockInstructionRemoteEntity.getInstructionLeft(),MockInstructionRemoteEntity.getInstructionRight(),MockInstructionRemoteEntity.getInstructionForward()])
    }
    
    static func getInstructionsOUTOFBOUNDS() -> TrackerInstructions {
        return InstructionsRemoteEntity(instructions: [MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward()])
    }
}

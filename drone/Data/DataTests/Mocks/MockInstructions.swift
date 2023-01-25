//
//  MockInstructionsRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation
@testable import Data
@testable import Tracker
import Domain

struct MockInstructionsRemoteEntity {
    static func getInstructions() -> TrackerInstructions {
        return InstructionsRemoteEntity(instructions: [MockInstructionRemoteEntity.getInstructionLeft(),MockInstructionRemoteEntity.getInstructionRight(),MockInstructionRemoteEntity.getInstructionForward()])
    }
    
    static func getInstructionsOUTOFBOUNDS() -> TrackerInstructions {
        return InstructionsRemoteEntity(instructions: [MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward(),MockInstructionRemoteEntity.getInstructionForward()])
    }
}

struct MockInstructions {
    static func getInstructions() -> Instructions {
        return Instructions(instructions: [MockInstruction.getInstructionLeft(),MockInstruction.getInstructionRight(),MockInstruction.getInstructionForward()])
    }
    
    static func getInstructionsOUTOFBOUNDS() -> Instructions {
        return Instructions(instructions: [MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward()])
    }
}

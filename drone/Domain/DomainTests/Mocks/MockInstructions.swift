//
//  MockInstructionsRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation
import Domain

struct MockInstructions {
    static func getInstructions() -> Instructions {
        return Instructions(instructions: [MockInstruction.getInstructionLeft(),MockInstruction.getInstructionRight(),MockInstruction.getInstructionForward()])
    }
    
    static func getInstructionsOUTOFBOUNDS() -> Instructions {
        return Instructions(instructions: [MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward(),MockInstruction.getInstructionForward()])
    }
}

//
//  MockInstructionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation
@testable import Data
@testable import Tracker
import Domain

struct MockInstructionRemoteEntity {
    static func getInstructionRight() -> TrackerInstruction {
        return InstructionRemoteEntity(movement: .right)
    }
    
    static func getInstructionLeft() -> TrackerInstruction {
        return InstructionRemoteEntity(movement: .left)
    }
    
    static func getInstructionForward() -> TrackerInstruction {
        return InstructionRemoteEntity(movement: .forward)
    }
}

struct MockInstruction {
    static func getInstructionRight() -> Instruction {
        return Instruction(movement: .right)
    }
    
    static func getInstructionLeft() -> Instruction {
        return Instruction(movement: .left)
    }
    
    static func getInstructionForward() -> Instruction {
        return Instruction(movement: .forward)
    }
}

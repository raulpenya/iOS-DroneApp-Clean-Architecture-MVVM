//
//  MockInstructionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation
import Domain

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

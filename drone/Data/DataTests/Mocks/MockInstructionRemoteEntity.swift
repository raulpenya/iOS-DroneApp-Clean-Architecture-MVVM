//
//  MockInstructionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 26/1/23.
//

import Foundation
@testable import Data
import Tracker

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

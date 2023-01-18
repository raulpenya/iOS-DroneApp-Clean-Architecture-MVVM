//
//  MockInstruction.swift
//  TrackerTests
//
//  Created by raulbot on 18/1/23.
//

import Foundation
import Tracker

struct MockInstruction: TrackerInstruction {
    var movement: TrackerMovement
    
    static func getInstructionTurnLeft() -> MockInstruction {
        return MockInstruction(movement: .left)
    }
    
    static func getInstructionTurnRight() -> MockInstruction {
        return MockInstruction(movement: .right)
    }
    
    static func getInstructionMoveForward() -> MockInstruction {
        return MockInstruction(movement: .forward)
    }
}

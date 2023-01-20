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
    
    static func getInstructionTurnLeft() -> TrackerInstruction {
        return MockInstruction(movement: .left)
    }
    
    static func getInstructionTurnRight() -> TrackerInstruction {
        return MockInstruction(movement: .right)
    }
    
    static func getInstructionMoveForward() -> TrackerInstruction {
        return MockInstruction(movement: .forward)
    }
    
    static func createInstruction(_ instructionString: String) -> TrackerInstruction? {
        guard let movement = createMovement(instructionString) else { return nil }
        return MockInstruction(movement: movement)
    }
    
    static func createMovement(_ movement: String) -> TrackerMovement? {
        var newMovement: TrackerMovement? = nil
        switch movement {
        case "R":
            newMovement = .right
        case "L":
            newMovement = .left
        case "M":
            newMovement = .forward
        default:
            assert(false, "TrackerInstruction :: createInstruction :: wrong instruction")
            break
        }
        return newMovement
    }
}

//
//  TrackerInstruction.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

public enum Movement {
    case right
    case left
    case forward
}

protocol TrackerInstruction {
    var movement: Movement { get set }
    static func createInstruction(_ instruction: String) -> Movement?
}

extension TrackerInstruction {
    static func createInstruction(_ movement: String) -> Movement? {
        var newMovement: Movement? = nil
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

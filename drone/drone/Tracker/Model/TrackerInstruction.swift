//
//  TrackerInstruction.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

public enum TrackerMovement {
    case right
    case left
    case forward
}

public protocol TrackerInstruction {
    var movement: TrackerMovement { get set }
//    static func createInstruction(_ instruction: String) -> TrackerMovement?
}

//extension TrackerInstruction {
//    static func createInstruction(_ movement: String) -> TrackerMovement? {
//        var newMovement: TrackerMovement? = nil
//        switch movement {
//        case "R":
//            newMovement = .right
//        case "L":
//            newMovement = .left
//        case "M":
//            newMovement = .forward
//        default:
//            assert(false, "TrackerInstruction :: createInstruction :: wrong instruction")
//            break
//        }
//        return newMovement
//    }
//}

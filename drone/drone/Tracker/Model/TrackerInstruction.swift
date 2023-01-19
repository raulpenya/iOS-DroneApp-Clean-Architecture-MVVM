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
}

//
//  TrackerInstruction.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

public enum TrackerMovement: Int {
    case right = 1
    case left
    case forward
}

public protocol TrackerInstruction {
    var movement: TrackerMovement { get set }
}

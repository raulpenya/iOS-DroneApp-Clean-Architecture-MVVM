//
//  Instruction.swift
//  Domain
//
//  Created by raulbot on 20/1/23.
//

import Foundation

public enum Movement: Int {
    case right = 1
    case left
    case forward
}

public struct Instruction {
    public let movement: Movement
    
    public init(movement: Movement) {
        self.movement = movement
    }
}

//
//  Drone.swift
//  Domain
//
//  Created by raulbot on 17/1/23.
//

import Foundation

public struct Drone {
    public let currentPosition: Position
    
    public init(currentPosition: Position) {
        self.currentPosition = currentPosition
    }
}

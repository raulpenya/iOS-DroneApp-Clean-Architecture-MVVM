//
//  Position.swift
//  Domain
//
//  Created by raulbot on 20/1/23.
//

import Foundation

public enum Direction: Int {
    case north = 1
    case south
    case east
    case west
}

public struct Position {
    public let direction: Direction
    public let coordinate: CGPoint
    
    public init(direction: Direction, coordinate: CGPoint) {
        self.direction = direction
        self.coordinate = coordinate
    }
}

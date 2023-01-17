//
//  Drone.swift
//  Domain
//
//  Created by raulbot on 17/1/23.
//

import Foundation

enum Direction {
    case north
    case south
    case east
    case west
}

protocol Drone {
    var speed: Float { get set }
    var direction: Direction { get set }
    var currentPosition: CGPoint { get set }
}

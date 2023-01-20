//
//  TrackerDrone.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

public protocol TrackerDrone {
    var speed: Double { get set }
    var currentPosition: TrackerPosition { get set }
}

extension TrackerDrone {
    func execute(movement: TrackerMovement) -> TrackerDrone {
        var drone = self
        var newPosition: TrackerPosition = drone.currentPosition
        switch movement {
        case .right:
            newPosition = drone.turnRight()
        case .left:
            newPosition = drone.turnLeft()
        case .forward:
            newPosition = drone.moveForward()
        }
        drone.currentPosition = newPosition
        return drone
    }
    
    internal func turnRight() -> TrackerPosition {
        var newPosition = currentPosition
        var newDirection = newPosition.direction.rawValue + 1
        if newDirection > TrackerDirection.west.rawValue {
            newDirection = TrackerDirection.north.rawValue
        }
        if let direction = TrackerDirection(rawValue: newDirection) {
            newPosition.direction = direction
        } else {
            assert(false, "TrackerDrone :: turnRight :: direction wrong")
        }
        return newPosition
    }
    
    internal func turnLeft() -> TrackerPosition {
        var newPosition = currentPosition
        var newDirection = newPosition.direction.rawValue - 1
        if newDirection < TrackerDirection.north.rawValue {
            newDirection = TrackerDirection.west.rawValue
        }
        if let direction = TrackerDirection(rawValue: newDirection) {
            newPosition.direction = direction
        } else {
            assert(false, "TrackerDrone :: turnLeft :: direction wrong")
        }
        return newPosition
    }
    
    internal func moveForward() -> TrackerPosition {
        var newPosition = currentPosition
        var newCoordinate = newPosition.coordinate
        switch newPosition.direction {
        case .north:
            newCoordinate = CGPoint(x: newCoordinate.x, y: newCoordinate.y + speed)
        case .east:
            newCoordinate = CGPoint(x: newCoordinate.x + speed, y: newCoordinate.y)
        case .south:
            newCoordinate = CGPoint(x: newCoordinate.x, y: newCoordinate.y - speed)
        case .west:
            newCoordinate = CGPoint(x: newCoordinate.x - speed, y: newCoordinate.y)
        }
        newPosition.coordinate = newCoordinate
        return newPosition
    }
}

//
//  TrackerDrone.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

protocol TrackerDrone {
    var speed: Double { get set }
    var currentPosition: TrackerPosition { get set }
    func execute(movement: Movement) -> TrackerDrone
}

extension TrackerDrone {
    func execute(movement: Movement) -> TrackerDrone {
        var drone = self
        var newPosition: TrackerPosition = drone.currentPosition
        switch movement {
        case .right:
            newPosition = drone.turnRight()
        case .left:
            newPosition = drone.turnLeft()
        case .forward:
            newPosition = drone.moveAhead()
        }
        drone.currentPosition = newPosition
        return drone
    }
    
    private func turnRight() -> TrackerPosition {
        var newPosition = currentPosition
        var newDirection = newPosition.direction.rawValue + 1
        if newDirection > Direction.west.rawValue {
            newDirection = Direction.north.rawValue
        }
        if let direction = Direction(rawValue: newDirection) {
            newPosition.direction = direction
        } else {
            assert(false, "TrackerDrone :: turnRight :: direction wrong")
        }
        return newPosition
    }
    
    private func turnLeft() -> TrackerPosition {
        var newPosition = currentPosition
        var newDirection = newPosition.direction.rawValue - 1
        if newDirection < Direction.north.rawValue {
            newDirection = Direction.west.rawValue
        }
        if let direction = Direction(rawValue: newDirection) {
            newPosition.direction = direction
        } else {
            assert(false, "TrackerDrone :: turnLeft :: direction wrong")
        }
        return newPosition
    }
    
    private func moveAhead() -> TrackerPosition {
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

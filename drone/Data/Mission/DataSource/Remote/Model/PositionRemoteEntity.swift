//
//  PositionRemoteEntity.swift
//  Data
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker
import Domain

struct PositionRemoteEntity: TrackerPosition {
    var direction: TrackerDirection
    var coordinate: CGPoint
}

extension TrackerPosition {
    func transformToDomain() -> Position? {
        guard let direction = Direction(rawValue: direction.rawValue) else { return nil }
        return Position(direction: direction, coordinate: coordinate)
    }
}

extension Position {
    func transformToRemote() -> TrackerPosition? {
        guard let direction = TrackerDirection(rawValue: direction.rawValue) else { return nil }
        return PositionRemoteEntity(direction: direction, coordinate: coordinate)
    }
}

extension TrackerDirection {
    static func getDirectionWithString(_ string: String) -> TrackerDirection? {
        var direction: TrackerDirection?
        switch string.uppercased() {
        case "N":
            direction = TrackerDirection.north
        case "E":
            direction = TrackerDirection.east
        case "S":
            direction = TrackerDirection.south
        case "W":
            direction = TrackerDirection.west
        default:
            break
        }
        return direction
    }
}

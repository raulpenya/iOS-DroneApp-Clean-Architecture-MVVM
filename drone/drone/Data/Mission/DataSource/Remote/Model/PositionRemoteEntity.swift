//
//  PositionRemoteEntity.swift
//  Data
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker

struct PositionRemoteEntity: TrackerPosition {
    var direction: TrackerDirection
    var coordinate: CGPoint
}

extension MissionDataRemoteEntity {
    func transformToRoverPosition() -> PositionRemoteEntity? {
        guard let x = roverPosition["x"], let y = roverPosition["y"], let direction = TrackerDirection.getDirectionWithString(roverDirection) else { return nil }
        return PositionRemoteEntity(direction: direction, coordinate: CGPoint(x: x, y: y))
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

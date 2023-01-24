//
//  MissionResultViewEntity.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import UIKit
import Domain

struct MissionResultViewEntity {
    let initialPosition: String
    let plateau: String
    let instructions: String
    let result: String
}

extension MissionResult {
    func transformToUI() -> MissionResultViewEntity {
        let initialPosition = mission.drone.currentPosition.description
        let plateau = mission.plateau.topRightCorner.description
        let instructions = mission.instructions.description
        var result = ""
        if let error = error {
            result = error.localizedDescription
        } else {
            result = lastPosition.description
        }
        return MissionResultViewEntity(initialPosition: initialPosition, plateau: plateau, instructions: instructions, result: result)
    }
}

extension Instructions: CustomStringConvertible {
    public var description: String {
        return instructions.compactMap { $0.movement.description }.joined(separator: "")
    }
}

extension Movement: CustomStringConvertible {
    public var description: String {
        var text = ""
        switch self {
        case .right:
            text = "R"
        case .left:
            text = "L"
        case .forward:
            text = "M"
        }
        return text
    }
}

extension Position: CustomStringConvertible {
    public var description: String {
        return coordinate.description + " " + direction.description
    }
}

extension Direction: CustomStringConvertible {
    public var description: String {
        var text = ""
        switch self {
        case .north:
            text = "N"
        case .south:
            text = "S"
        case .east:
            text = "E"
        case .west:
            text = "W"
        }
        return text
    }
}

extension CGPoint: CustomStringConvertible {
    public var description: String {
        return String(format: "%.0f", x) + " " + String(format: "%.0f", y)
    }
}

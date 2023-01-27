//
//  MissionDataRemoteEntity.swift
//  Data
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker

struct MissionDataRemoteEntity : Decodable {
    var topRightCorner: Dictionary<String, Double>
    var roverPosition: Dictionary<String, Double>
    var roverDirection: String
    var movements: String
}

extension MissionDataRemoteEntity {
    func transformToMissionRemoteEntity() -> TrackerMission? {
        guard let roverPosition = transformToRoverPosition(),
                let plateau = transformToPlateau(),
                let instructions = transformToInstructions() else { return nil }
        let drone = DroneRemoteEntity(currentPosition: roverPosition)
        return MissionRemoteEntity(drone: drone, plateau: plateau, instructions: instructions)
    }
    
    func transformToRoverPosition() -> TrackerPosition? {
        guard let x = roverPosition["x"], let y = roverPosition["y"], let direction = TrackerDirection.createDirection(with: roverDirection) else { return nil }
        return PositionRemoteEntity(direction: direction, coordinate: CGPoint(x: x, y: y))
    }
    
    func transformToPlateau() -> TrackerPlateau? {
        guard let x = topRightCorner["x"], let y = topRightCorner["y"], x >= 0, y >= 0 else { return nil }
        return PlateauRemoteEntity(topRightCorner: CGPoint(x: x, y: y))
    }
    
    func transformToInstructions() -> TrackerInstructions? {
        let arrayMovements = Array(movements).compactMap { String($0) }
        let instructions = arrayMovements.compactMap { TrackerMovement.createMovement(with: $0) }.compactMap { InstructionRemoteEntity(movement: $0) }
        guard arrayMovements.count == instructions.count else { return nil }
        return InstructionsRemoteEntity(instructions: instructions)
    }
}

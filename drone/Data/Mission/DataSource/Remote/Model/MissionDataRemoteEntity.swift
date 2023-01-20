//
//  MissionDataRemoteEntity.swift
//  Data
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker

//{
//"topRightCorner": { "x" : 5, "y" : 5 },
//"roverPosition": {"x" : 1, "y" : 2 },
//"roverDirection": "N",
//"movements" : "LMLMLMLMM"
//}

struct MissionDataRemoteEntity : Decodable {
    var topRightCorner: Dictionary<String, Double>
    var roverPosition: Dictionary<String, Double>
    var roverDirection: String
    var movements: String
}
extension MissionDataRemoteEntity {
    func transformMissionRemoteEntity() -> TrackerMission? {
        guard let roverPosition = transformToRoverPosition(),
                let plateau = transformToPlateau() else { return nil }
        let drone = DroneRemoteEntity(currentPosition: roverPosition)
        let instructions = transformToInstructions()
        return MissionRemoteEntity(drone: drone, plateau: plateau, instructions: instructions)
    }
    
    func transformToRoverPosition() -> TrackerPosition? {
        guard let x = roverPosition["x"], let y = roverPosition["y"], let direction = TrackerDirection.getDirectionWithString(roverDirection) else { return nil }
        return PositionRemoteEntity(direction: direction, coordinate: CGPoint(x: x, y: y))
    }
    
    func transformToPlateau() -> TrackerPlateau? {
        guard let x = topRightCorner["x"], let y = topRightCorner["y"], x >= 0, y >= 0 else { return nil }
        return PlateauRemoteEntity(topRightCorner: CGPoint(x: x, y: y))
    }
    
    func transformToInstructions() -> TrackerInstructions {
        let instructions = Array(movements).compactMap { String($0) }.compactMap { TrackerMovement.createMovement($0) }.compactMap { InstructionRemoteEntity(movement: $0) }
        return InstructionsRemoteEntity(instructions: instructions)
    }
}

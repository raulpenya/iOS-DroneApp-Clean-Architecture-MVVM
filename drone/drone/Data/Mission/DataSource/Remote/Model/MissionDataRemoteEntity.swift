//
//  MissionDataRemoteEntity.swift
//  Data
//
//  Created by raulbot on 19/1/23.
//

import Foundation

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
    
    func transformMissionRemoteEntity() -> MissionRemoteEntity? {
        guard let roverPosition = transformToRoverPosition(),
                let plateau = transformToPlateau() else { return nil }
        let drone = DroneRemoteEntity(currentPosition: roverPosition)
        let instructions = transformToInstructions()
        return MissionRemoteEntity(drone: drone, plateau: plateau, instructions: instructions)
    }
}

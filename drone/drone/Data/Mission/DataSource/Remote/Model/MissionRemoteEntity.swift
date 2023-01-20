//
//  MissionRemoteEntity.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker
import Domain

struct MissionRemoteEntity: TrackerMission {
    var drone: TrackerDrone
    var plateau: TrackerPlateau
    var instructions: TrackerInstructions
}

extension MissionRemoteEntity {
    func transformToDomain() -> Mission? {
        guard let drone = drone.transformToDomain(), let instructions = instructions.transformToDomain() else { return nil }
        let plateau = plateau.transformToDomain()
        return Mission(drone: drone, plateau: plateau, instructions: instructions)
    }
}

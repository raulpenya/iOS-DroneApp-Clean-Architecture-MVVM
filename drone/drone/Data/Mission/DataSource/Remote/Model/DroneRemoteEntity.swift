//
//  DroneRemoteEntity.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker
import Domain

struct DroneRemoteEntity: TrackerDrone {
    var speed: Double = 1
    var currentPosition: TrackerPosition
}

extension TrackerDrone {
    func transformToDomain() -> Drone? {
        guard let position = currentPosition.transformToDomain() else { return nil }
        return Drone(currentPosition: position)
    }
}

//
//  DroneRemoteEntity.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker

struct DroneRemoteEntity: TrackerDrone {
    var speed: Double = 1
    var currentPosition: TrackerPosition
}

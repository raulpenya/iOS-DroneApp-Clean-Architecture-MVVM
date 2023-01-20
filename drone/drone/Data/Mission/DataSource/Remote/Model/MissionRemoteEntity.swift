//
//  MissionRemoteEntity.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker

struct MissionRemoteEntity: TrackerMission {
    var drone: TrackerDrone
    var plateau: TrackerPlateau
    var instructions: TrackerInstructions
}

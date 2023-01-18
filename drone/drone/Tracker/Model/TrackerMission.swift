//
//  TrackerMission.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

protocol TrackerMission {
    var drone: TrackerDrone { get set }
    var plateau: TrackerPlateau { get set }
    var instructions: TrackerInstructions { get set }
}

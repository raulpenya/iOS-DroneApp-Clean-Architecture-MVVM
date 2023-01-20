//
//  Mission.swift
//  Domain
//
//  Created by raulbot on 19/1/23.
//

import Foundation

public struct Mission {
    let drone: Drone
    let plateau: Plateau
    let instructions: Instructions
    
    public init(drone: Drone, plateau: Plateau, instructions: Instructions) {
        self.drone = drone
        self.plateau = plateau
        self.instructions = instructions
    }
}

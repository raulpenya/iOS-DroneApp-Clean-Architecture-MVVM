//
//  MissionResult.swift
//  Domain
//
//  Created by raulbot on 20/1/23.
//

import Foundation

public struct MissionResult {
    let mission: Mission
    let lastPosition: Position
    let error: Error?
    
    public init(mission: Mission, lastPosition: Position, error: Error?) {
        self.mission = mission
        self.lastPosition = lastPosition
        self.error = error
    }
}

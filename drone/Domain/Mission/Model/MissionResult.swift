//
//  MissionResult.swift
//  Domain
//
//  Created by raulbot on 20/1/23.
//

import Foundation

public struct MissionResult {
    public let mission: Mission
    public let lastPosition: Position
    public let error: Error?
    
    public init(mission: Mission, lastPosition: Position, error: Error?) {
        self.mission = mission
        self.lastPosition = lastPosition
        self.error = error
    }
}

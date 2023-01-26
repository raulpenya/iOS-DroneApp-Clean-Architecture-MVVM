//
//  MockMissionResultViewEntity.swift
//  droneTests
//
//  Created by raulbot on 26/1/23.
//

import Foundation
@testable import drone

struct MockMissionResultViewEntity {
    
    static let initialPositionDefault = "initialPosition"
    static let plateauDefault = "initialPosition"
    static let instructionsDefault = "initialPosition"
    static let resultDefault = "initialPosition"
    
    static func getMissionResult() -> MissionResultViewEntity {
        return MissionResultViewEntity(initialPosition: MockMissionResultViewEntity.initialPositionDefault, plateau: MockMissionResultViewEntity.plateauDefault, instructions: MockMissionResultViewEntity.instructionsDefault, result: MockMissionResultViewEntity.resultDefault)
    }
}

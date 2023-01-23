//
//  MockMissionDataRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
@testable import Data

struct MockMissionDataRemoteEntity {
    static func getMissionDataNOError() -> MissionDataRemoteEntity {
        let topRightCorner: Dictionary<String, Double> =  [ "x" : 5, "y" : 5 ]
        let roverPosition: Dictionary<String, Double> = [ "x" : 1, "y" : 2 ]
        let roverDirection = "N"
        let movements = "LMLMLMLMM"
        return MissionDataRemoteEntity(topRightCorner: topRightCorner, roverPosition: roverPosition, roverDirection: roverDirection, movements: movements)
    }
    
    static func getMissionDataTopRightCornerERROR() -> MissionDataRemoteEntity {
        let topRightCorner: Dictionary<String, Double> =  [ "x" : -5, "y" : 5 ]
        let roverPosition: Dictionary<String, Double> = [ "x" : 1, "y" : 2 ]
        let roverDirection = "N"
        let movements = "LMLMLMLMM"
        return MissionDataRemoteEntity(topRightCorner: topRightCorner, roverPosition: roverPosition, roverDirection: roverDirection, movements: movements)
    }
    
    static func getMissionDataRoverPositionLOWERCASE() -> MissionDataRemoteEntity {
        let topRightCorner: Dictionary<String, Double> =  [ "x" : 5, "y" : 5 ]
        let roverPosition: Dictionary<String, Double> = [ "x" : 1, "y" : -2 ]
        let roverDirection = "n"
        let movements = "LMLMLMLMM"
        return MissionDataRemoteEntity(topRightCorner: topRightCorner, roverPosition: roverPosition, roverDirection: roverDirection, movements: movements)
    }
    
    static func getMissionDataRoverPositionERROR() -> MissionDataRemoteEntity {
        let topRightCorner: Dictionary<String, Double> =  [ "x" : 5, "y" : 5 ]
        let roverPosition: Dictionary<String, Double> = [ "x" : 1, "y" : -2 ]
        let roverDirection = "P"
        let movements = "LMLMLMLMM"
        return MissionDataRemoteEntity(topRightCorner: topRightCorner, roverPosition: roverPosition, roverDirection: roverDirection, movements: movements)
    }
    
    static func getMissionDataRoverDirectionLOWERCASE() -> MissionDataRemoteEntity {
        let topRightCorner: Dictionary<String, Double> =  [ "x" : 5, "y" : 5 ]
        let roverPosition: Dictionary<String, Double> = [ "x" : 1, "y" : 2 ]
        let roverDirection = "N"
        let movements = "lmlmlmlmm"
        return MissionDataRemoteEntity(topRightCorner: topRightCorner, roverPosition: roverPosition, roverDirection: roverDirection, movements: movements)
    }
    
    static func getMissionDataMovementsERROR() -> MissionDataRemoteEntity {
        let topRightCorner: Dictionary<String, Double> =  [ "x" : 5, "y" : 5 ]
        let roverPosition: Dictionary<String, Double> = [ "x" : 1, "y" : 2 ]
        let roverDirection = "N"
        let movements = "LMLXLMLMM"
        return MissionDataRemoteEntity(topRightCorner: topRightCorner, roverPosition: roverPosition, roverDirection: roverDirection, movements: movements)
    }
}

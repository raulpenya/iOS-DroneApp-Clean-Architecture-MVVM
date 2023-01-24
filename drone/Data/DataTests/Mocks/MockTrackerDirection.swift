//
//  MockTrackerDirection.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation

struct MockTrackerDirection {
    static func getDirectionNorth() -> String {
        return "N"
    }
    
    static func getDirectionNorthLOWERCASE() -> String {
        return "n"
    }
    
    static func getDirectionEast() -> String {
        return "E"
    }
    
    static func getDirectionSouth() -> String {
        return "S"
    }
    
    static func getDirectionWest() -> String {
        return "W"
    }
    
    static func getDirectionERROR() -> String {
        return "X"
    }
}

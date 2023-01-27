//
//  MockTrackerMovement.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation

struct MockTrackerMovement {
    static func getMovementStringLeft() -> String {
        return "L"
    }
    
    static func getMovementStringLeftLOWERCASE() -> String {
        return "l"
    }
    
    static func getMovementStringRight() -> String {
        return "R"
    }
    
    static func getMovementStringForward() -> String {
        return "M"
    }
    
    static func getMovementStringERROR() -> String {
        return "X"
    }
}


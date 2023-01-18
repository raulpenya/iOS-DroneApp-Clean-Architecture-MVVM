//
//  MockPosition.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation
import Tracker

struct MockPosition: TrackerPosition {
    var direction: TrackerDirection
    var coordinate: CGPoint
    
    static func getPositionPointingNorth() -> MockPosition {
        return MockPosition(direction: .north, coordinate: .zero)
    }
    
    static func getPositionPointingEast() -> MockPosition {
        return MockPosition(direction: .east, coordinate: .zero)
    }
    
    static func getPositionPointingSouth() -> MockPosition {
        return MockPosition(direction: .south, coordinate: .zero)
    }
    
    static func getPositionPointingWest() -> MockPosition {
        return MockPosition(direction: .west, coordinate: .zero)
    }
}

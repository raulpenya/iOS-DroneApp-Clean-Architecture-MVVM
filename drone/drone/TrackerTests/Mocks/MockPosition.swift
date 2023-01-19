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
    
    static func getPositionPointingNorth() -> TrackerPosition {
        return MockPosition(direction: .north, coordinate: .zero)
    }
    
    static func getPositionPointingEast() -> TrackerPosition {
        return MockPosition(direction: .east, coordinate: .zero)
    }
    
    static func getPositionPointingSouth() -> TrackerPosition {
        return MockPosition(direction: .south, coordinate: .zero)
    }
    
    static func getPositionPointingWest() -> TrackerPosition {
        return MockPosition(direction: .west, coordinate: .zero)
    }
    
    static func getPositionPointingNorthOutOfBounds() -> TrackerPosition {
        return MockPosition(direction: .north, coordinate: CGPoint(x: -1, y: -1))
    }
    
    static func getREQUESTEDPosition() -> TrackerPosition {
        return MockPosition(direction: .north, coordinate: CGPoint(x: 1, y: 2))
    }
}

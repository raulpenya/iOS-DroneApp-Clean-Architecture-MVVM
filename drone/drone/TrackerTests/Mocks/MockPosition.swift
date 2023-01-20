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
    
    static func getPositionWithDirection(_ direction: TrackerDirection) -> TrackerPosition {
        return MockPosition(direction: direction, coordinate: .zero)
    }
    
    static func getPositionPointingNorthOutOfBounds() -> TrackerPosition {
        return MockPosition(direction: .north, coordinate: CGPoint(x: -1, y: -1))
    }
    
    static func getREQUESTEDPosition() -> TrackerPosition {
        return MockPosition(direction: .north, coordinate: CGPoint(x: 1, y: 2))
    }
}

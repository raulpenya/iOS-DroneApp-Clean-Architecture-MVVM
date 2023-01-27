//
//  TrackerPlateau.swift
//  TrackerTests
//
//  Created by raulbot on 18/1/23.
//

import Foundation
import Tracker

struct MockTrackerPlateau: TrackerPlateau {
    var letfBottomCorner: CGPoint = .zero
    var topRightCorner: CGPoint
    
    static func getPlateau5x5() -> TrackerPlateau {
        return MockTrackerPlateau(topRightCorner: CGPoint(x: 5, y: 5))
    }
    
    static func getREQUESTEDPlateau() -> TrackerPlateau {
        return MockTrackerPlateau(topRightCorner: CGPoint(x: 5, y: 5))
    }
}

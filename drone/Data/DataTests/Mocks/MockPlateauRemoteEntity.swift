//
//  MockPlateauRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
@testable import Data
@testable import Tracker

struct MockPlateauRemoteEntity {
    static func getPlateau() -> TrackerPlateau {
        return PlateauRemoteEntity(topRightCorner: CGPoint(x: 5, y: 5))
    }
    
    static func getPlateauLetfBottomCornerERROR_X() -> TrackerPlateau {
        return PlateauRemoteEntity(letfBottomCorner: CGPoint(x: -5, y: 5), topRightCorner: CGPoint(x: 5, y: 5))
    }
    
    static func getPlateauLetfBottomCornerERROR_Y() -> TrackerPlateau {
        return PlateauRemoteEntity(letfBottomCorner: CGPoint(x: 5, y: -5), topRightCorner: CGPoint(x: 5, y: 5))
    }
    
    static func getPlateauTopRightCornerERROR_X() -> TrackerPlateau {
        return PlateauRemoteEntity(topRightCorner: CGPoint(x: 5, y: -5))
    }
    
    static func getPlateauTopRightCornerERROR_Y() -> TrackerPlateau {
        return PlateauRemoteEntity(topRightCorner: CGPoint(x: -5, y: 5))
    }
}

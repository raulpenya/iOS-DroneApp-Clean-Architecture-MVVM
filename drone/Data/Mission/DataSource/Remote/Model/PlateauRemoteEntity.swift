//
//  PlateauRemoteEntity.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import UIKit
import Tracker
import Domain

struct PlateauRemoteEntity: TrackerPlateau {
    var letfBottomCorner: CGPoint = CGPoint.zero
    var topRightCorner: CGPoint
}

extension TrackerPlateau {
    func transformToDomain() -> Plateau {
        return Plateau(topRightCorner: topRightCorner)
    }
}

extension Plateau {
    func transformToRemote() -> PlateauRemoteEntity {
        return PlateauRemoteEntity(topRightCorner: topRightCorner)
    }
}

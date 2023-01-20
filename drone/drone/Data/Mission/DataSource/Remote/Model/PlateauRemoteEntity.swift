//
//  PlateauRemoteEntity.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker
import Domain

struct PlateauRemoteEntity: TrackerPlateau {
    var topRightCorner: CGPoint
}

extension TrackerPlateau {
    func transformToDomain() -> Plateau {
        return Plateau(topRightCorner: topRightCorner)
    }
}

extension MissionDataRemoteEntity {
    func transformToPlateau() -> PlateauRemoteEntity? {
        guard let x = topRightCorner["x"], let y = topRightCorner["y"] else { return nil }
        return PlateauRemoteEntity(topRightCorner: CGPoint(x: x, y: y))
    }
}

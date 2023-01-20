//
//  PlateauRemoteEntity.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker

struct PlateauRemoteEntity: TrackerPlateau {
    var topRightCorner: CGPoint
}

extension MissionDataRemoteEntity {
    func transformToPlateau() -> PlateauRemoteEntity? {
        guard let x = topRightCorner["x"], let y = topRightCorner["y"] else { return nil }
        return PlateauRemoteEntity(topRightCorner: CGPoint(x: x, y: y))
    }
}

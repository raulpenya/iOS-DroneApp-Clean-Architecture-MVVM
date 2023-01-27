//
//  MockPlateauRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 26/1/23.
//

import Foundation
@testable import Data
import Tracker

struct MockPlateauRemoteEntity {
    static func getPlateau() -> TrackerPlateau {
        return PlateauRemoteEntity(topRightCorner: CGPoint(x: 5, y: 5))
    }
}

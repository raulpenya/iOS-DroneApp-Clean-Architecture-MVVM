//
//  MockPositionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 26/1/23.
//

import Foundation
@testable import Data
import Tracker

struct MockPositionRemoteEntity {
    static func getPosition() -> TrackerPosition {
        return PositionRemoteEntity(direction: .north, coordinate: .zero)
    }
    
    static func getPositionWRONG() -> TrackerPosition {
        return PositionRemoteEntity(direction: .north, coordinate: CGPoint(x: -1, y: -4))
    }
}

//
//  MockPositionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
@testable import Data
@testable import Tracker
import Domain

struct MockPositionRemoteEntity {
    static func getPosition() -> TrackerPosition {
        return PositionRemoteEntity(direction: .north, coordinate: .zero)
    }
    
    static func getPositionWRONG() -> TrackerPosition {
        return PositionRemoteEntity(direction: .north, coordinate: CGPoint(x: -1, y: -4))
    }
}

struct MockPosition {
    static func getPosition() -> Position {
        return Position(direction: .north, coordinate: .zero)
    }
    
    static func getPositionWRONG() -> Position {
        return Position(direction: .north, coordinate: CGPoint(x: -1, y: -4))
    }
}

//
//  MockPositionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
@testable import Data
@testable import Tracker
@testable import Domain

struct MockPositionRemoteEntity {
    static func getPosition() -> TrackerPosition {
        return PositionRemoteEntity(direction: .north, coordinate: .zero)
    }
}

struct MockPosition {
    static func getPosition() -> Position {
        return Position(direction: .north, coordinate: .zero)
    }
}

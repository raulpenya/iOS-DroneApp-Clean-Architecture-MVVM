//
//  MockPositionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
@testable import Data
@testable import Tracker

struct MockPositionRemoteEntity {
    static func getPosition() -> TrackerPosition {
        return PositionRemoteEntity(direction: .north, coordinate: .zero)
    }
}

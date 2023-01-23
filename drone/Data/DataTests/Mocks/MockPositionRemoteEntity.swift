//
//  MockPositionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
@testable import Data

struct MockPositionRemoteEntity {
    static func getPosition() -> PositionRemoteEntity {
        return PositionRemoteEntity(direction: .north, coordinate: .zero)
    }
}

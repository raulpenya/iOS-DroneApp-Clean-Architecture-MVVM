//
//  MockDroneRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
@testable import Data

struct MockDroneRemoteEntity {
    static func getPosition() -> DroneRemoteEntity {
        return DroneRemoteEntity(currentPosition: MockPositionRemoteEntity.getPosition())
    }
}

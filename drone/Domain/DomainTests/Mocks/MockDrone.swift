//
//  MockDroneRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
import Domain

struct MockDrone {
    static func getDrone() -> Drone {
        return Drone(currentPosition: MockPosition.getPosition())
    }
    
    static func getDroneWRONGInitialPosition() -> Drone {
        return Drone(currentPosition: MockPosition.getPositionWRONG())
    }
}

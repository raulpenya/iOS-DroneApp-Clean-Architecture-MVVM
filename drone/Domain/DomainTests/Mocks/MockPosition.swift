//
//  MockPositionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
import Domain

struct MockPosition {
    static func getPosition() -> Position {
        return Position(direction: .north, coordinate: .zero)
    }
    
    static func getPositionWRONG() -> Position {
        return Position(direction: .north, coordinate: CGPoint(x: -1, y: -4))
    }
}

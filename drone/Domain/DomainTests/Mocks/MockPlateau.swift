//
//  MockPlateauRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
import Domain

struct MockPlateau {
    static func getPlateau() -> Plateau {
        return Plateau(topRightCorner: CGPoint(x: 5, y: 5))
    }
}

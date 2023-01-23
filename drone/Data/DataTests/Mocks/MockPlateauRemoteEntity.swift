//
//  MockPlateauRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
@testable import Data

struct MockPlateauRemoteEntity {
    static func getPlateau() -> PlateauRemoteEntity {
        return PlateauRemoteEntity(topRightCorner: CGPoint(x: 5, y: 5))
    }
    
    static func getPlateauERROR_X() -> PlateauRemoteEntity {
        return PlateauRemoteEntity(letfBottomCorner: CGPoint(x: -5, y: 5), topRightCorner: CGPoint(x: 5, y: 5))
    }
    
    static func getPlateauERROR_Y() -> PlateauRemoteEntity {
        return PlateauRemoteEntity(letfBottomCorner: CGPoint(x: 5, y: -5), topRightCorner: CGPoint(x: 5, y: 5))
    }
}

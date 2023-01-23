//
//  MissionResultViewEntity.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import Foundation
import Domain

struct MissionResultViewEntity {
    let initialPosition: String
    let plateau: String
    let instructions: [String]
    let result: String
}

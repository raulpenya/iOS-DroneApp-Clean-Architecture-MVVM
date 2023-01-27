//
//  TrackerInstructions.swift
//  drone
//
//  Created by raulbot on 18/1/23.
//

import Foundation

public protocol TrackerInstructions {
    var instructions: [TrackerInstruction] { get set }
}

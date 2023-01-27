//
//  MockTrackerInstructions.swift
//  TrackerTests
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker

struct MockTrackerInstructions: TrackerInstructions {
    var instructions: [TrackerInstruction]
    
    static func getREQUESTEDInstructions() -> TrackerInstructions {
        let instructionsString = "LMLMLMLMM"
        let instructionsArray = Array(instructionsString).compactMap { String($0) }
        let instructions = instructionsArray.compactMap {  MockTrackerInstruction.createInstruction($0) }
        return MockTrackerInstructions(instructions: instructions)
    }
    
    static func getWRONGInstructions() -> TrackerInstructions {
        let instructionsString = "LMMMMMMMM"
        let instructionsArray = Array(instructionsString).compactMap { String($0) }
        let instructions = instructionsArray.compactMap {  MockTrackerInstruction.createInstruction($0) }
        return MockTrackerInstructions(instructions: instructions)
    }
}

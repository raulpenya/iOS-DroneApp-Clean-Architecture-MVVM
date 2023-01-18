//
//  TrackerErrors.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

enum TrackerErrors: Int, Error {
    case instructionOutOfBounds = 700
    var localizedDescription: String {
        switch self {
        case .instructionOutOfBounds:
            return "TrackerErrors :: Instruction Out Of Bounds"
        }
    }
    var code: Int { return rawValue }
}

//
//  TrackerErrors.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

public enum TrackerErrors: Int, Error {
    case initialPositionOutOfBounds = 700
    case instructionOutOfBounds = 701
    public var localizedDescription: String {
        switch self {
        case .initialPositionOutOfBounds:
            return "TrackerErrors :: Inital position out of bounds"
        case .instructionOutOfBounds:
            return "TrackerErrors :: Instruction out of bounds"
        }
    }
    public var code: Int { return rawValue }
}

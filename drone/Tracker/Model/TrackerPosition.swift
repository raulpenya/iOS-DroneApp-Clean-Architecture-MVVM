//
//  TrackerPosition.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

public enum TrackerDirection: Int {
    case north = 1
    case east
    case south
    case west
}

public protocol TrackerPosition {
    var direction: TrackerDirection { get set }
    var coordinate: CGPoint { get set }
}

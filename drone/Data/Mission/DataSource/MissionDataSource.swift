//
//  MissionDataSource.swift
//  Data
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Combine
import Domain

public protocol MissionDataSource {
    func getMissionInfo() -> AnyPublisher<Mission, Error>
    func getMissionResult(_ mission: Mission) -> AnyPublisher<MissionResult, Error>
}

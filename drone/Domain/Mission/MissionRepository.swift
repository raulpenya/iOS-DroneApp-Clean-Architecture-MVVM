//
//  MissionRepository.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Combine

public protocol MissionRepository {
    func getMissionInfo() -> AnyPublisher<Mission, Error>
    func getMissionResult(_ mission: Mission) -> AnyPublisher<MissionResult, Error>
}

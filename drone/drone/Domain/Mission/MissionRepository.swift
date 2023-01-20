//
//  MissionRepository.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Combine

public protocol MissionRepository {
    func getMissionInfo() -> AnyPublisher<Bool, Error>
    func getMissionResult() -> AnyPublisher<Bool, Error>
}

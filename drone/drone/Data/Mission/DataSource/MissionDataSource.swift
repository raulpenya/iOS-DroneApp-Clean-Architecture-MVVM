//
//  MissionDataSource.swift
//  Data
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Combine

public protocol MissionDataSource {
    func getMissionInfo() -> AnyPublisher<Mission, Error>
    func getMissionResult() -> AnyPublisher<Bool, Error>
}

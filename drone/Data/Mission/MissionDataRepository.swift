//
//  MissionDataRepository.swift
//  Data
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Combine
import Domain

public struct MissionDataRepository: MissionRepository {
    
    private let remoteDataSource: MissionDataSource
    
    public func getMissionInfo() -> AnyPublisher<Mission, Error> {
        return remoteDataSource.getMissionInfo()
    }
    
    public func getMissionResult(_ mission: Mission) -> AnyPublisher<MissionResult, Error> {
        return remoteDataSource.getMissionResult(mission)
    }
}

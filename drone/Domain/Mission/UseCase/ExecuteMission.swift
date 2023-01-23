//
//  ExecuteMission.swift
//  Domain
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Combine

public class ExecuteMission: UseCase {
    typealias T = MissionResult
    typealias Q = ExecuteMissionRequestValues
    let repository: MissionRepository
    
    public init(repository: MissionRepository) {
        self.repository = repository
    }
    
    public func execute(_ requestValues: ExecuteMissionRequestValues) -> AnyPublisher<MissionResult, Error> {
        let repository = repository
        return repository.getMissionInfo().flatMap { result in
            print(result)
            return repository.getMissionResult(result)
        }.eraseToAnyPublisher()
    }
}

public class ExecuteMissionRequestValues: RequestValues {
    public init() {}
}

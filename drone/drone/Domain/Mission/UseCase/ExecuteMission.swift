//
//  ExecuteMission.swift
//  Domain
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Combine

public class ExecuteMission: UseCase {
    typealias T = Bool
    typealias Q = ExecuteMissionDTO
    let repository: MissionRepository
    
    public init(repository: MissionRepository) {
        self.repository = repository
    }
    
    func execute(_ dto: ExecuteMissionDTO) -> AnyPublisher<Bool, Error> {
        let repository = repository
        return repository.getMissionInfo().flatMap { result in
            print(result)
            return repository.getMissionResult(result)
        }.eraseToAnyPublisher()
    }
}

public class ExecuteMissionDTO: DTO {
    public init() {}
}

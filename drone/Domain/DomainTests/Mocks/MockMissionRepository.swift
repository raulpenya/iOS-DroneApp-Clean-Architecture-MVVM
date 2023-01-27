//
//  MockMissionRepository.swift
//  DomainTests
//
//  Created by raulbot on 25/1/23.
//

import Foundation
import Domain
import Combine

enum RepositoryResponse {
    case success
    case error
}

class MockMissionRepository: MissionRepository {
    var getMissionInfoCalled: Bool = false
    var getMissionResultCalled: Bool = false
    var getMissionInfoResponse: RepositoryResponse = .success
    var getMissionResultResponse: RepositoryResponse = .success

    func getMissionInfo() -> AnyPublisher<Domain.Mission, Error> {
        getMissionInfoCalled = true
        switch getMissionInfoResponse {
        case .success:
            return Result.Publisher(MockMission.getMission()).eraseToAnyPublisher()
        case .error:
            return Fail(error: RepositoryErrors.executeException as Error).eraseToAnyPublisher()
        }
    }
    
    func getMissionResult(_ mission: Domain.Mission) -> AnyPublisher<Domain.MissionResult, Error> {
        getMissionResultCalled = true
        switch getMissionResultResponse {
        case .success:
            return Result.Publisher(MockMissionResult.getMissionResult()).eraseToAnyPublisher()
        case .error:
            return Fail(error: RepositoryErrors.executeException as Error).eraseToAnyPublisher()
        }
    }
}

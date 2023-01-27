//
//  MockExecuteMission.swift
//  droneTests
//
//  Created by raulbot on 26/1/23.
//

import Foundation
@testable import Domain
import Combine

class MockExecuteMission: ExecuteMission {
    var called: Bool = false
    var response: RepositoryResponse = .success
    
    static func getUseCase() -> MockExecuteMission {
        return MockExecuteMission(repository: MockMissionRepository())
    }
    
    override func execute(_ requestValues: ExecuteMissionRequestValues) -> AnyPublisher<MissionResult, Error> {
        called = true
        switch response {
        case .success:
            return Result.Publisher(MockMissionResult.getMissionResult()).eraseToAnyPublisher()
        case .error:
            return Fail(error: RepositoryErrors.executeException as Error).eraseToAnyPublisher()
        }
    }
}

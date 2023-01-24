//
//  MockMissionRemotelDataSource.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation
import Data
import Combine
import Domain

enum DataSourceResponse {
    case success
    case error
}

class MockMissionRemotelDataSource: MissionDataSource {
    var called: Bool = false
    var response: DataSourceResponse = .success
    
    func getMissionInfo() -> AnyPublisher<Domain.Mission, Error> {
        called = true
        switch response {
        case .success:
            return Result.Publisher(MockMission.getMission()).eraseToAnyPublisher()
        case .error:
            return Fail(error: NSError(domain: "MockMissionRemotelDataSource.getMissionInfo.error", code: 400)).eraseToAnyPublisher()
        }
    }
    
    func getMissionResult(_ mission: Domain.Mission) -> AnyPublisher<Domain.MissionResult, Error> {
        called = true
        switch response {
        case .success:
            return Result.Publisher(MockMissionResult.getMissionResult()).eraseToAnyPublisher()
        case .error:
            return Fail(error: NSError(domain: "MockMissionRemotelDataSource.getMissionResult.error", code: 400)).eraseToAnyPublisher()
        }
    }
}

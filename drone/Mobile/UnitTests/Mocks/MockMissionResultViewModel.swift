//
//  MockMissionResultViewModel.swift
//  droneTests
//
//  Created by raulbot on 26/1/23.
//

import Foundation
import Domain
@testable import drone

class MockMissionResultViewModel: MissionResultViewModel {
    var executeMissionCalled = false
    var response: RepositoryResponse = .success
    override func executeMission() {
        executeMissionCalled = true
        switch response {
        case .success:
            missionResult = MockMissionResultViewEntity.getMissionResult()
        case .error:
            errorDescription = ErrorDescription(text: RepositoryErrors.executeException.localizedDescription)
        }
    }
}

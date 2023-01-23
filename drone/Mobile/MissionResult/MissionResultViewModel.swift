//
//  MissionResultViewModel.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import Foundation
import Domain

class MissionResultViewModel: ObservableObject {
    
    @Published var missionResult: MissionResultViewEntity?
    let executeMissionUseCase: ExecuteMission
    
    init(executeMissionUseCase: ExecuteMission) {
        self.executeMissionUseCase = executeMissionUseCase
    }
    
    
}

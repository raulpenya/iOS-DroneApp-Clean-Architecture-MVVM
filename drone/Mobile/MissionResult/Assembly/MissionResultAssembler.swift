//
//  MissionResultAssembler.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import Foundation
import Domain
import Data

protocol MissionResultAssembler {
    func resolve() -> MissionResultView
}

extension MissionResultAssembler {
    func resolve() -> MissionResultView {
        return MissionResultView(notesViewModel: resolve())
    }
    
    func resolve() -> MissionResultViewModel {
        return MissionResultViewModel(executeMissionUseCase: resolve())
    }
    
    func resolve() -> ExecuteMission {
        return ExecuteMission(repository: resolve())
    }
    
    func resolve() -> MissionRepository {
        return MissionDataRepository(remoteDataSource: MissionRemoteDataSource())
    }
}

class MissionResultAssemblerInjection: MissionResultAssembler {}

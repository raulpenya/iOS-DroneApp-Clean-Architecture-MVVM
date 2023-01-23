//
//  MissionResultViewModel.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import Foundation
import Domain
import Combine

class MissionResultViewModel: ObservableObject {
    
    @Published var missionResult: MissionResultViewEntity?
    let executeMissionUseCase: ExecuteMission
    
    init(executeMissionUseCase: ExecuteMission) {
        self.executeMissionUseCase = executeMissionUseCase
    }
    
    func executeMissionButtonPressed() {
        executeMission()
    }
    
    func getInitialPositionText() -> String {
        guard let result = missionResult else { return NSLocalizedString("no_data_text", comment: "") }
        return result.initialPosition
    }
    
    func getPlateauText() -> String {
        guard let result = missionResult else { return NSLocalizedString("no_data_text", comment: "") }
        return result.plateau
    }
    
    func getInstructionsText() -> String {
        guard let result = missionResult else { return NSLocalizedString("no_data_text", comment: "") }
        return result.instructions.joined(separator: "")
    }
    
    func getResultText() -> String {
        guard let result = missionResult else { return "" }
        return result.result
    }
}

extension MissionResultViewModel {
    private func executeMission() {
        executeMissionUseCase.execute(ExecuteMissionRequestValues()).sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                print("Error \(error)")
//                let error = ErrorDescription(name: error.localizedDescription)
//                self?.errorDescription = error
                print(error)
            case .finished:
                print("Publisher is finished")
            }
        } receiveValue: { [weak self] result in
            print(result)
//            self?.notes = notes.compactMap { $0.transformToUI() }
        }.cancel()
    }
}

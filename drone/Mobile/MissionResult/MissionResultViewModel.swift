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
    @Published var errorDescription: ErrorDescription?
    let executeMissionUseCase: ExecuteMission
    static let noDataText = NSLocalizedString("no_data_text", comment: "")
    
    init(executeMissionUseCase: ExecuteMission) {
        self.executeMissionUseCase = executeMissionUseCase
    }
    
    func executeMissionButtonPressed() {
        executeMission()
    }
    
    func getInitialPositionText() -> String {
        guard let result = missionResult else { return MissionResultViewModel.noDataText }
        return result.initialPosition
    }
    
    func getPlateauText() -> String {
        guard let result = missionResult else { return MissionResultViewModel.noDataText }
        return result.plateau
    }
    
    func getInstructionsText() -> String {
        guard let result = missionResult else { return MissionResultViewModel.noDataText }
        return result.instructions
    }
    
    func getResultText() -> String {
        var text = ""
        if let result = missionResult {
            text = result.result
        } else if let errorDescription = errorDescription {
            text = errorDescription.text
        }
        return text
    }
    
    //MARK: MissionResultViewModel private methods
    //TODO: async method and improve tests
    internal func executeMission() {
        executeMissionUseCase.execute(ExecuteMissionRequestValues()).sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.missionResult = nil
                let error = ErrorDescription(text: (error as? RepositoryErrors)?.localizedDescription ?? error.localizedDescription)
                self?.errorDescription = error
            case .finished:
                print("MissionResultViewModel :: executeMission :: publisher finished")
            }
        } receiveValue: { [weak self] result in
            print("MissionResultViewModel :: executeMission :: result :: \(result)")
            self?.missionResult = result.transformToUI()
        }.cancel()
    }
}

//
//  MissionRemoteDataSource.swift
//  Data
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Combine
import Domain
import Tracker

public class MissionRemoteDataSource: MissionDataSource {
    
    static let fileName = "input"
    
    public func getMissionInfo() -> AnyPublisher<Mission, Error> {
        do {
            guard let mission = try getInfoFromFile().transformToMissionRemoteEntity()?.transformToDomain() else {
                return Fail(error:  NSError(domain: "NoteRepository.getNotes.decode", code: 400)).eraseToAnyPublisher()
            }
            return Result.Publisher(mission).eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    public func getMissionResult(_ mission: Mission) -> AnyPublisher<MissionResult, Error> {
        guard let mission = mission.transformToRemote() else {
            return Fail(error:  NSError(domain: "NoteRepository.getNotes.decode", code: 400)).eraseToAnyPublisher()
        }
        let missionResult = getResultFromTracket(mission: mission).transformToRemote()
        guard let missionResultDomain = missionResult.transformToDomain() else {
            return Fail(error:  NSError(domain: "NoteRepository.getNotes.decode", code: 400)).eraseToAnyPublisher()
        }
        return Result.Publisher(missionResultDomain).eraseToAnyPublisher()
    }
}

extension MissionRemoteDataSource {
    func getInfoFromFile(_ filename: String = MissionRemoteDataSource.fileName, fileLoader: FileLoader = FileLoader()) throws -> MissionDataRemoteEntity {
        guard let data = try fileLoader.loadJson(filename: MissionRemoteDataSource.fileName) else {
            throw NSError(domain: "NoteRepository.getNotes.decode", code: 400)
        }
        return try JSONDecoder().decode(MissionDataRemoteEntity.self, from: data)
    }
    
    func getResultFromTracket(_ tracker: Tracker = Tracker(), mission: TrackerMission) -> TrackerMissionResult {
        return tracker.getResult(from: mission)
    }
}

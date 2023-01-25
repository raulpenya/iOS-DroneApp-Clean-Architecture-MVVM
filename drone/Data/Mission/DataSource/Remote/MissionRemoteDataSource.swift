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
    
    public init() {}
    
    public func getMissionInfo() -> AnyPublisher<Mission, Error> {
        do {
            guard let mission = try getInfoFromFile().transformToMissionRemoteEntity()?.transformToDomain() else {
                return Fail(error: RepositoryErrors.jsonError as Error).eraseToAnyPublisher()
            }
            return Result.Publisher(mission).eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    public func getMissionResult(_ mission: Mission) -> AnyPublisher<MissionResult, Error> {
        guard let mission = mission.transformToRemote() else {
            return Fail(error: RepositoryErrors.parametersException as Error).eraseToAnyPublisher()
        }
        guard let missionResultDomain = getResultFromTracket(mission: mission).transformToDomain() else {
            return Fail(error: RepositoryErrors.parametersException as Error).eraseToAnyPublisher()
        }
        return Result.Publisher(missionResultDomain).eraseToAnyPublisher()
    }
}

extension MissionRemoteDataSource {
    func getInfoFromFile(_ filename: String = MissionRemoteDataSource.fileName, fileLoader: FileLoader = FileLoader()) throws -> MissionDataRemoteEntity {
        guard let data = try fileLoader.loadJson(filename: filename) else {
            throw RepositoryErrors.jsonError as Error
        }
        return try JSONDecoder().decode(MissionDataRemoteEntity.self, from: data)
    }
    
    func getResultFromTracket(_ tracker: Tracker = Tracker(), mission: TrackerMission) -> TrackerMissionResult {
        return tracker.getResult(from: mission)
    }
}

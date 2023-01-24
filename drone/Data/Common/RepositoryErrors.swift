//
//  RepositoryErrors.swift
//  Data
//
//  Created by raulbot on 24/1/23.
//

import Foundation

enum RepositoryErrors: Int, Error {
    case executeException = 405
    case parametersException = 406
    case jsonError = 407
    var localizedDescription: String {
        switch self {
        case .executeException:
            return "RepositoryErrors :: execute exception"
        case .parametersException:
            return "TrackerErrors :: parameter exception"
        case .jsonError:
            return "TrackerErrors :: json error"
        }
    }
    var code: Int { return rawValue }
}

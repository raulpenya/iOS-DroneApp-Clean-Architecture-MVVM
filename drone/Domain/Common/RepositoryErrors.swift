//
//  RepositoryErrors.swift
//  Data
//
//  Created by raulbot on 24/1/23.
//

import Foundation

public enum RepositoryErrors: Int, Error {
    case executeException = 405
    case parametersException = 406
    case jsonError = 407
    public var localizedDescription: String {
        switch self {
        case .executeException:
            return "RepositoryErrors :: execute exception"
        case .parametersException:
            return "RepositoryErrors :: parameter exception"
        case .jsonError:
            return "RepositoryErrors :: json error"
        }
    }
    public var code: Int { return rawValue }
}

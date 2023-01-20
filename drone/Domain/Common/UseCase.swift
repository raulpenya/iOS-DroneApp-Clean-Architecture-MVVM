//
//  UseCase.swift
//  Domain
//
//  Created by raulbot on 19/1/23.
//

import Combine

protocol UseCase {
    associatedtype T
    associatedtype Q: RequestValues
    func execute(_ dto: Q) -> AnyPublisher<T, Error>
}

protocol RequestValues { }

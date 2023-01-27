//
//  ErrorDescription.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import Foundation

struct ErrorDescription: Identifiable {
    var id: String = UUID().uuidString
    let text: String
}

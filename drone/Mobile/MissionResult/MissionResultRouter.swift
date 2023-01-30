//
//  MissionResultRouter.swift
//  drone
//
//  Created by raulbot on 30/1/23.
//

import SwiftUI

class MissionResultRouter: Router {
    typealias T = MissionEditorView
    typealias Q = MissionEditorDependecies
    
    func destination(_ dependencies: MissionEditorDependecies) -> MissionEditorView {
        return MissionEditorAssemblerInjection().resolve()
    }
}

class MissionEditorDependecies: Dependecies {
    public init() {}
}

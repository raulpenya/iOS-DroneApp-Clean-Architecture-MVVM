//
//  MissionEditorAssembler.swift
//  drone
//
//  Created by raulbot on 30/1/23.
//

import Foundation
import Domain
import Data

protocol MissionEditorAssembler {
    func resolve() -> MissionEditorView
}

extension MissionEditorAssembler {
    func resolve() -> MissionEditorView {
        return MissionEditorView(viewModel: MissionEditorViewModel())
    }
}

class MissionEditorAssemblerInjection: MissionEditorAssembler {}

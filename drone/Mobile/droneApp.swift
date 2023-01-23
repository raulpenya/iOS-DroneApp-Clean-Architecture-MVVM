//
//  droneApp.swift
//  drone
//
//  Created by raulbot on 17/1/23.
//

import SwiftUI

@main
struct droneApp: App {
    var body: some Scene {
        WindowGroup {
            MissionResultAssemblerInjection().resolve()
        }
    }
}

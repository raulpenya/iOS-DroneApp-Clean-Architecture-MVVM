//
//  ResultLabel.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import SwiftUI

struct ResultLabel: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration).foregroundColor(.gray)
                            .padding(.horizontal, 16)
    }
}

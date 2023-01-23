//
//  TitleLabel.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import SwiftUI

struct TitleLabel: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration).underline()
                            .foregroundColor(.gray)
                            .padding(.horizontal, 16)
    }
}


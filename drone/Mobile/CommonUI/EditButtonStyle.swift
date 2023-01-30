//
//  EditButtonStyle.swift
//  drone
//
//  Created by raulbot on 30/1/23.
//

import SwiftUI

struct EditButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.gray)
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .buttonStyle(PlainButtonStyle())
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 1)
            )
    }
}

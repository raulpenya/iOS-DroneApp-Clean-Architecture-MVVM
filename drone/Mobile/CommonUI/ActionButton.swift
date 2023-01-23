//
//  ActionButton.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import SwiftUI

struct ActionButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .font(.system(size: 20, weight: Font.Weight.bold))
            .foregroundColor(Color.white)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
            .buttonStyle(PlainButtonStyle())
    }
}

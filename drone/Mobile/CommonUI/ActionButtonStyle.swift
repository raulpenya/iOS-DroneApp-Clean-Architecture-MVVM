//
//  ActionButtonStyle.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 8).fill(.blue))
            .buttonStyle(PlainButtonStyle())
    }
}

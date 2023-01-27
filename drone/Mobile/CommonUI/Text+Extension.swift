//
//  TitleLabel.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import SwiftUI

extension Text {
    
    
    static let horizontalPadding: CGFloat = 20
    static let verticalPadding: CGFloat = 20
    
    func applyTitleLabelStyle() -> some View {
        return underline()
            .font(.system(size: 20, weight: Font.Weight.bold))
            .foregroundColor(.gray)
            .padding(.horizontal, Text.horizontalPadding)
            .padding(.vertical, Text.verticalPadding)
    }
    
    func applySubtitleLabelStyle() -> some View {
        return underline()
            .foregroundColor(.gray)
            .padding(.horizontal, Text.horizontalPadding)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func applyInfoLabelStyle() -> some View {
        return foregroundColor(.gray)
            .padding(.horizontal, Text.horizontalPadding)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func applyResultLabelStyle() -> some View {
        return font(.system(size: 20, weight: Font.Weight.bold))
            .foregroundColor(.gray)
            .padding(.horizontal, Text.horizontalPadding)
            .padding(.vertical, Text.verticalPadding)
    }
}


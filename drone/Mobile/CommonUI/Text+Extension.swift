//
//  TitleLabel.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import SwiftUI

extension Text {
    func applyTitleLabelStyle() -> some View {
        return underline()
            .font(.system(size: 20, weight: Font.Weight.bold))
            .foregroundColor(.gray)
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
    }
    
    func applySubtitleLabelStyle() -> some View {
        return underline()
            .foregroundColor(.gray)
            .padding(.horizontal, 16)
    }
    
    func applyInfoLabelStyle() -> some View {
        return foregroundColor(.gray)
            .padding(.horizontal, 16)
    }
    
    func applyResultLabelStyle() -> some View {
        return foregroundColor(.gray)
            .padding(.horizontal, 16)
    }
}


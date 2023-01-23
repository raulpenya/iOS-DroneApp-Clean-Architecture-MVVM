//
//  MissionResultView.swift
//  drone
//
//  Created by raulbot on 23/1/23.
//

import SwiftUI

struct MissionResultView: View {
    
    @ObservedObject var notesViewModel: MissionResultViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text(NSLocalizedString("mission_result_title", comment: ""))
                    .labelStyle(TitleLabel())
                HStack {
                    Text(NSLocalizedString("initial_position_text", comment: ""))
                        .labelStyle(SubtitleLabel())
                    Text(NSLocalizedString("initial_position_text", comment: ""))
                        .labelStyle(InfoLabel())
                }
                HStack {
                    Text(NSLocalizedString("plateau_text", comment: ""))
                        .labelStyle(SubtitleLabel())
                    Text(NSLocalizedString("plateau_text", comment: ""))
                        .labelStyle(InfoLabel())
                }
                HStack {
                    Text(NSLocalizedString("instructions_text", comment: ""))
                        .labelStyle(SubtitleLabel())
                    Text(NSLocalizedString("instructions_text", comment: ""))
                        .labelStyle(InfoLabel())
                }
                Text(NSLocalizedString("result", comment: ""))
                    .labelStyle(ResultLabel())
                Button(NSLocalizedString("create_button", comment: "")) {
                    
                }.buttonStyle(ActionButton())
            }
        }
    }
}

struct MissionResultView_Previews: PreviewProvider {
    static var previews: some View {
        MissionResultAssemblerInjection().resolve()
    }
}

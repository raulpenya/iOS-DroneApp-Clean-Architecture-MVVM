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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MissionResultView_Previews: PreviewProvider {
    static var previews: some View {
        MissionResultAssemblerInjection().resolve()
    }
}

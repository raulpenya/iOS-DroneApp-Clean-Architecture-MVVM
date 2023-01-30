//
//  MissionEditorView.swift
//  drone
//
//  Created by raulbot on 30/1/23.
//

import SwiftUI

struct MissionEditorView: View {
    
    @ObservedObject var viewModel: MissionEditorViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Text("MissionEditor")
                .navigationTitle("MissionEditor")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Dismiss", action: dismiss.callAsFunction)
                    }
                }
        }
    }
}

struct MissionEditorView_Previews: PreviewProvider {
    static var previews: some View {
        MissionEditorAssemblerInjection().resolve()
    }
}

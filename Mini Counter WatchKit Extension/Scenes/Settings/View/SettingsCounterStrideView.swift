//
//  SettingsCounterStrideView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import SwiftUI

struct SettingsCounterStrideView: View {
    @ObservedObject private var settingsStore: SettingsStore
    
    init(settingsStore: SettingsStore) {
        self.settingsStore = settingsStore
    }

    var body: some View {
        HStack {
            CircularButton(
                systemImageName: "minus",
                buttonColor: Color.pistachio
            ) {
                settingsStore.decrementStride()
            }
            .squareFrame(32)
            .disabled(settingsStore.isStrideAtLowerBound)
            
            Text("\(settingsStore.counterStride)")
                .font(Font.title)
                .maxWidth()
                .padding()
            
            CircularButton(
                systemImageName: "plus",
                buttonColor: Color.pistachio
            ) {
                settingsStore.incrementStride()
            }
            .squareFrame(32)
            .disabled(settingsStore.isStringAtUpperBound)
        }
        .padding()
    }
}

// MARK: - Preview
#if DEBUG
struct SettingsCounterStrideView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCounterStrideView(settingsStore: .init())
    }
}
#endif

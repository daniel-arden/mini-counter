//
//  SettingsCounterStrideView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import SwiftUI

struct SettingsCounterStrideView: View {
    // MARK: Stores

    @EnvironmentObject private var settingsStore: SettingsStore

    var body: some View {
        HStack {
            CircularImageButton("minus", color: .greenSourCandy) {
                settingsStore.decrementStride()
            }
            .squareFrame(32)
            .disabled(settingsStore.isStrideAtLowerBound)

            Text("\(settingsStore.counterStride)")
                .font(.title)
                .maxWidth()
                .padding()

            CircularImageButton("plus", color: .greenSourCandy) {
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
            SettingsCounterStrideView()
        }
    }
#endif

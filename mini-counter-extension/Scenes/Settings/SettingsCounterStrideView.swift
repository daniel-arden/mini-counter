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
            .accessibilityLabel(LocString.settingsCounterStrideViewA11yMinusLabel())
            .accessibilityHint(LocString.settingsCounterStrideViewA11yMinusHint())

            Text("\(settingsStore.counterStride)")
                .font(.title)
                .maxWidth()
                .padding()
                .accessibilityLabel(
                    LocString.settingsCounterStrideViewA11yStrideLabel(
                        settingsStore.counterStride
                    )
                )

            CircularImageButton("plus", color: .greenSourCandy) {
                settingsStore.incrementStride()
            }
            .squareFrame(32)
            .disabled(settingsStore.isStringAtUpperBound)
            .accessibilityLabel(LocString.settingsCounterStrideViewA11yPlusLabel())
            .accessibilityHint(LocString.settingsCounterStrideViewA11yPlusHint())
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

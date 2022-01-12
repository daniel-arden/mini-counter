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
            imageButton("minus") {
                settingsStore.decrementStride()
            }
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

            imageButton("plus") {
                settingsStore.incrementStride()
            }
            .disabled(settingsStore.isStringAtUpperBound)
            .accessibilityLabel(LocString.settingsCounterStrideViewA11yPlusLabel())
            .accessibilityHint(LocString.settingsCounterStrideViewA11yPlusHint())
        }
        .padding()
    }
}

// MARK: - Supplementary Views

private extension SettingsCounterStrideView {
    func imageButton(_ systemImageName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: systemImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .maxFrame()
                .padding()
                .background(Color.greenSourCandy)
                .clipShape(Circle())
        }
        .squareFrame(32)
        .buttonStyle(.plain)
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

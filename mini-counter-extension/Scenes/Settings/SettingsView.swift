//
//  SettingsView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 10.11.2021.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var settingsStore: SettingsStore

    var body: some View {
        List {
            Section(header: strideSectionHeader) {
                SettingsCounterStrideView(settingsStore: settingsStore)
            }

            Section(header: counterColorSectionHeader) {
                SettingsCounterColorView(settingsStore: settingsStore)
            }
        }
        .headerProminence(.increased)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(LocString.settingsViewNavigationTitle())
    }
}

// MARK: - Supplementary Views

private extension SettingsView {
    @ViewBuilder
    private var strideSectionHeader: some View {
        Text(LocString.settingsViewCounterStrideHeaderTitle())
    }

    @ViewBuilder
    private var counterColorSectionHeader: some View {
        Text(LocString.settingsViewCounterColorHeaderTitle())
    }
}

// MARK: - Preview

#if DEBUG
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
#endif

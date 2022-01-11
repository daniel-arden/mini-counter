//
//  SettingsView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 10.11.2021.
//

import SwiftUI

struct SettingsView: View {
    // MARK: Stores

    @StateObject private var settingsStore = SettingsStore()

    var body: some View {
        List {
            Section(
                header: strideSectionHeader,
                footer: strideSectionFooter
            ) {
                SettingsCounterStrideView()
            }

            Section(header: counterColorSectionHeader) {
                SettingsCounterColorView()
            }
        }
        .environmentObject(settingsStore)
        .headerProminence(.increased)
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(LocString.settingsViewNavigationTitle())
    }
}

// MARK: - Supplementary Views

private extension SettingsView {
    private var strideSectionHeader: some View {
        Text(LocString.settingsViewCounterStrideHeaderTitle())
    }

    private var strideSectionFooter: some View {
        Text(LocString.settingsViewCounterStrideFooterTitle())
    }

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

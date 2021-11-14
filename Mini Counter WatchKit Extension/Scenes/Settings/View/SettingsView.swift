//
//  SettingsView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 10.11.2021.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject private var settingsStore: SettingsStore

    init(settingsStore: SettingsStore) {
        self.settingsStore = settingsStore
    }

    var body: some View {
        List {
            Section(header: strideSectionHeader) {
               SettingsCounterStrideView(settingsStore: settingsStore)
            }
            
            Section(header: appTintSectionHeader) {
                // TODO: SettingsAppTintView
                Text("SettingsAppTintView")
            }
        }
        .headerProminence(Prominence.increased)
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
    }
}

// MARK: - Supplementary Views
private extension SettingsView {
    @ViewBuilder
    private var strideSectionHeader: some View {
        Text("COUNTER STRIDE")
    }
    
    @ViewBuilder
    private var appTintSectionHeader: some View {
        Text("APP TINT")
    }
}

// MARK: - Preview

#if DEBUG
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView(settingsStore: .init())
        }
    }
#endif

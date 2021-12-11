//
//  ContentView.swift
//  mini-counter WatchKit Extension
//
//  Created by Daniel Arden on 10.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex = Constants.defaultSelectedMainTabIndex

    // TODO: Refactor the stores below so that they are in proper places
    @StateObject private var mainStore = MainStore()
    @StateObject private var counterStore = CounterStore()
    @StateObject private var savedEntryStore = SavedEntryStore()
    @StateObject private var settingsStore = SettingsStore()

    var body: some View {
        TabView(selection: $selectedIndex) {
            ActionsView()
                .tag(0)

            CounterView()
                .tag(1)

            SavedEntryListView()
                .tag(2)
        }
        .environmentObject(mainStore)
        .environmentObject(counterStore)
        .environmentObject(savedEntryStore)
        .environmentObject(settingsStore)
        .onReceive(mainStore.selectTabIndexPublisher) { newSelectedIndex in
            selectedIndex = newSelectedIndex
        }
        .onReceive(mainStore.resetCounterPublisher) { _ in
            counterStore.resetCounter()
        }
    }
}

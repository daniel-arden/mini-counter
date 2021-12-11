//
//  ContentView.swift
//  mini-counter WatchKit Extension
//
//  Created by Daniel Arden on 10.12.2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: Stores

    @StateObject private var mainStore = MainStore()
    @StateObject private var counterStore = CounterStore()

    // MARK: Private Properties

    @State private var selectedIndex = Constants.defaultSelectedMainTabIndex

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
        .onReceive(mainStore.selectTabIndexPublisher) {
            selectedIndex = $0
        }
        .onReceive(mainStore.resetCounterPublisher) {
            counterStore.resetCounter()
        }
    }
}

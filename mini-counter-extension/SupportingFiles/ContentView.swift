//
//  ContentView.swift
//  mini-counter WatchKit Extension
//
//  Created by Daniel Arden on 10.12.2021.
//

import CoreData
import SwiftUI

struct ContentView: View {
    // MARK: Stores

    @StateObject private var mainStore = MainStore()
    @StateObject private var counterStore = CounterStore()
    @StateObject private var savedEntryStore = SavedEntryStore()

    // MARK: Private Properties

    @State private var selectedIndex = Constants.defaultSelectedContentViewTabIndex
    private var moc: NSManagedObjectContext {
        mainStore.moc
    }

    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(ContentViewTab.allCases, id: \.self) {
                $0.view
            }
        }
        .environmentObject(mainStore)
        .environmentObject(counterStore)
        .environmentObject(savedEntryStore)
        .environment(\.managedObjectContext, moc)
        .onReceive(mainStore.tabDidSelect) {
            selectedIndex = $0.rawValue
        }
        .onReceive(mainStore.resetCounterPublisher) {
            counterStore.resetCounter()
        }
    }
}

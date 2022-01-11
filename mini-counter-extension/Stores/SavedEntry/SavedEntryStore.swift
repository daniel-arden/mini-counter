//
//  SavedEntryStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 08.12.2021.
//

import SwiftUI

final class SavedEntryStore: ObservableObject {
    @AppStorage(UserDefaults.Key.counterColor.rawValue) var counterColor = Constants.defaultCounterColor
    @Published var selection = Set<CountEntry>()
}

// MARK: - Helpers

extension SavedEntryStore {
    func toggleSelectionOnCountEntry(_ countEntry: CountEntry) {
        if selection.contains(countEntry) {
            selection.remove(countEntry)
        } else {
            selection.insert(countEntry)
        }
    }

    func resetSelection() {
        selection.removeAll()
    }
}

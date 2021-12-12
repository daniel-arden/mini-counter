//
//  SavedEntryStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 08.12.2021.
//

import SwiftUI

final class SavedEntryStore: ObservableObject {
    @AppStorage(UserDefaults.Key.counterColor.rawValue) var counterColor = Constants.defaultCounterColor
    @Published var selection = Set<UUID>()
    @Published var savedEntries = CountEntry.mockData // TODO: Fetch Data from persistent storage
}

// MARK: - Helpers

extension SavedEntryStore {
    func toggleSelectionOnID(_ uuid: UUID) {
        if selection.contains(uuid) {
            selection.remove(uuid)
        } else {
            selection.insert(uuid)
        }
    }

    func resetSelection() {
        selection.removeAll()
    }

    func removeSelectedEntries() {
        selection.forEach { selectedEntryID in
            savedEntries.removeAll { countEntry in
                countEntry.id == selectedEntryID
            }
        }

        resetSelection()
    }

    func removeEntry(id: UUID) {
        savedEntries.removeAll { $0.id == id }
    }
}

//
//  MainStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 19.11.2021.
//

import Combine
import CoreData
import SwiftUI

final class MainStore: ObservableObject {
    // MARK: Public Properies

    let moc = PersistenceController.shared.container.viewContext
    let resetCounterPublisher = PassthroughSubject<Void, Never>()
    let tabDidSelect = PassthroughSubject<ContentViewTab, Never>()
}

// TODO: Error Handling
extension MainStore {
    func selectTab(_ contentViewTab: ContentViewTab) {
        tabDidSelect.send(contentViewTab)
    }

    func saveCounterCount(_ counterCount: Int, label: String) {
        let newCountEntry = CountEntry(context: moc)
        newCountEntry.saveDate = Date()
        newCountEntry.count = Int64(counterCount)
        newCountEntry.label = label
        try? moc.save()
    }

    func removeEntries(_ savedEntries: Set<CountEntry>) {
        savedEntries.forEach(moc.delete)
        try? moc.save()
    }

    func removeEntry(_ savedEntry: CountEntry) {
        moc.delete(savedEntry)
        try? moc.save()
    }

    func updateCountEntryLabel(_ countEntry: CountEntry, newLabel: String) {
        countEntry.label = newLabel
        try? moc.save()
    }
}

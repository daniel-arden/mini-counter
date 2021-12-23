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
    let selectTabIndexPublisher = PassthroughSubject<Int, Never>() // TODO: Refactor this so that it rather uses an enum value or is not necessary
}

extension MainStore {
    func saveCounterCount(_ counterCount: Int, label: String) {
        let newCountEntry = CountEntry(context: moc)
        newCountEntry.saveDate = Date()
        newCountEntry.count = Int64(counterCount)
        newCountEntry.id = UUID()
        newCountEntry.label = label

        do {
            try moc.save()
        } catch {
            // TODO: Error handling
        }
    }

    func removeEntries(_ savedEntries: Set<CountEntry>) {
        savedEntries.forEach(moc.delete)

        do {
            try moc.save()
        } catch {
            // TODO: Error handling
        }
    }
}

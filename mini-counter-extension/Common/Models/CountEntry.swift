//
//  CountEntry.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 04.11.2021.
//

import CoreData

final class CountEntry: NSManagedObject {
    @NSManaged var saveDate: Date?
    @NSManaged var count: Int64
    @NSManaged var label: String

    var formattedDate: String {
        saveDate?.formatted(date: .abbreviated, time: .shortened) ?? "-"
    }
}

// MARK: - Identifiable

extension CountEntry: Identifiable {}

// MARK: - Sort Descriptors

extension CountEntry {
    static func sortDescriptors() -> [SortDescriptor<CountEntry>] {
        [SortDescriptor(\.saveDate, order: .reverse)]
    }
}

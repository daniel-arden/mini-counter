//
//  CountEntry.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 04.11.2021.
//

import Foundation

struct CountEntry: Identifiable, Equatable {
    let id = UUID()
    let saveDate = Date()
    let count: Int
    let label: String

    var formattedDate: String {
        saveDate.formatted(date: .abbreviated, time: .shortened)
    }
}

extension CountEntry {
    static let mockData: [CountEntry] = [
        CountEntry(count: 144, label: "KG of apples in the car"),
        CountEntry(count: 190, label: "Catsh*t in the garden"),
        CountEntry(count: 50, label: ""),
        CountEntry(count: 23, label: "books"),
        CountEntry(count: 60, label: "cookies in the fridge"),
        CountEntry(count: 319, label: "things I have promised"),
        CountEntry(count: 1, label: "excuse"),
        CountEntry(count: 232, label: "FHEFJFEjf"),
        CountEntry(count: 399, label: "balbal"),
        CountEntry(count: 0, label: ""),
        CountEntry(count: 42, label: "shfwiafjofaoaf faweilf"),
        CountEntry(count: 144, label: "KG of apples in the car"),
        CountEntry(count: 190, label: "Catsh*t in the garden"),
        CountEntry(count: 50, label: ""),
        CountEntry(count: 23, label: "books"),
        CountEntry(count: 60, label: "cookies in the fridge"),
        CountEntry(count: 319, label: "things I have promised"),
        CountEntry(count: 1, label: "excuse"),
        CountEntry(count: 232, label: "FHEFJFEjf"),
        CountEntry(count: 399, label: "balbal"),
        CountEntry(count: 0, label: ""),
        CountEntry(count: 42, label: "shfwiafjofaoaf faweilf"),
        CountEntry(count: 144, label: "KG of apples in the car"),
        CountEntry(count: 190, label: "Catsh*t in the garden"),
        CountEntry(count: 50, label: ""),
        CountEntry(count: 23, label: "books"),
        CountEntry(count: 60, label: "cookies in the fridge"),
        CountEntry(count: 319, label: "things I have promised"),
        CountEntry(count: 1, label: "excuse"),
        CountEntry(count: 232, label: "FHEFJFEjf"),
        CountEntry(count: 399, label: "balbal"),
        CountEntry(count: 0, label: ""),
        CountEntry(count: 42, label: "shfwiafjofaoaf faweilf")
    ]
}

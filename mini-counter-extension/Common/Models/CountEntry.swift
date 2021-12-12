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
    let description: String

    var formattedDate: String {
        saveDate.formatted(date: .abbreviated, time: .shortened)
    }
}

extension CountEntry {
    static let mockData: [CountEntry] = [
        CountEntry(count: 144, description: "KG of apples in the car"),
        CountEntry(count: 190, description: "Catsh*t in the garden"),
        CountEntry(count: 50, description: ""),
        CountEntry(count: 23, description: "books"),
        CountEntry(count: 60, description: "cookies in the fridge"),
        CountEntry(count: 319, description: "things I have promised"),
        CountEntry(count: 1, description: "excuse"),
        CountEntry(count: 232, description: "FHEFJFEjf"),
        CountEntry(count: 399, description: "balbal"),
        CountEntry(count: 0, description: ""),
        CountEntry(count: 42, description: "shfwiafjofaoaf faweilf"),
        CountEntry(count: 144, description: "KG of apples in the car"),
        CountEntry(count: 190, description: "Catsh*t in the garden"),
        CountEntry(count: 50, description: ""),
        CountEntry(count: 23, description: "books"),
        CountEntry(count: 60, description: "cookies in the fridge"),
        CountEntry(count: 319, description: "things I have promised"),
        CountEntry(count: 1, description: "excuse"),
        CountEntry(count: 232, description: "FHEFJFEjf"),
        CountEntry(count: 399, description: "balbal"),
        CountEntry(count: 0, description: ""),
        CountEntry(count: 42, description: "shfwiafjofaoaf faweilf"),
        CountEntry(count: 144, description: "KG of apples in the car"),
        CountEntry(count: 190, description: "Catsh*t in the garden"),
        CountEntry(count: 50, description: ""),
        CountEntry(count: 23, description: "books"),
        CountEntry(count: 60, description: "cookies in the fridge"),
        CountEntry(count: 319, description: "things I have promised"),
        CountEntry(count: 1, description: "excuse"),
        CountEntry(count: 232, description: "FHEFJFEjf"),
        CountEntry(count: 399, description: "balbal"),
        CountEntry(count: 0, description: ""),
        CountEntry(count: 42, description: "shfwiafjofaoaf faweilf")
    ]
}

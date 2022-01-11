//
//  MainStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 19.11.2021.
//

import Combine

final class MainStore: ObservableObject {
    let resetCounterPublisher = PassthroughSubject<Void, Never>()
    let selectTabIndexPublisher = PassthroughSubject<Int, Never>() // TODO: Refactor this so that it rather uses an enum value or is not necessary
    @Published var savedEntries = [CountEntry]()
}

extension MainStore {
    func saveCounterCount(_ counterCount: Int, description: String) {
        let countEntry = CountEntry(count: counterCount, description: description)
        // TODO: Save the data into a persistent storage
        savedEntries.append(countEntry)
    }
}

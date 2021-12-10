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

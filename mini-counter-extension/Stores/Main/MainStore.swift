//
//  MainStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 19.11.2021.
//

import Combine

final class MainStore: ObservableObject {
    let resetCounterPublisher = PassthroughSubject<Void, Never>()
    let selectTabIndexPublisher = PassthroughSubject<Int, Never>()
    @Published var savedEntries = [CountEntry]()
}

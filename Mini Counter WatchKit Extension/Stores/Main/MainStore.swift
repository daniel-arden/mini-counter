//
//  MainStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 19.11.2021.
//

import protocol Combine.ObservableObject
import class Combine.PassthroughSubject
import struct Combine.Published

final class MainStore: ObservableObject {
    let resetCounterPublisher: PassthroughSubject<Void, Never> = PassthroughSubject<Void, Never>()
    let selectTabIndexPublisher: PassthroughSubject<Int, Never> = PassthroughSubject<Int, Never>()
    @Published var savedEntries: [CountEntry] = []
}

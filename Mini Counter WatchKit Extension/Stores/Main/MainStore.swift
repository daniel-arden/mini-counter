//
//  MainStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 19.11.2021.
//

import protocol Combine.ObservableObject
import class Combine.PassthroughSubject

final class MainStore: ObservableObject {
    let selectTabIndexPublisher: PassthroughSubject<Int, Never> = PassthroughSubject<Int, Never>()
}

//
//  CounterStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import SwiftUI

final class CounterStore: ObservableObject {
    @AppStorage(UserDefaults.Key.counterStride.rawValue) var counterStride = Constants.defaultCounterStride
    @AppStorage(UserDefaults.Key.counterColor.rawValue) var counterColor = Constants.defaultCounterColor
    @Published var counterValue = 0.0
}

// MARK: - Helpers

extension CounterStore {
    func resetCounter() {
        counterValue = 0.0
    }
}

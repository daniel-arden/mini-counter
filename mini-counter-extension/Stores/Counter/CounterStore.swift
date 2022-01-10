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
    @AppStorage(UserDefaults.Key.counterValue.rawValue) var counterValue = 0.0
    /// Serves as a storage for a reverted count
    @AppStorage(UserDefaults.Key.counterLabel.rawValue) var counterLabel = ""
}

// MARK: - Helpers

extension CounterStore {
    func resetCounter() {
        counterValue = 0.0
        counterLabel = ""
    }
}

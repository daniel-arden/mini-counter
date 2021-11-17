//
//  CounterStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import SwiftUI

final class CounterStore: ObservableObject {
    @AppStorage(UserDefaults.Key.counterStride.rawValue) var counterStride: Int = Constants.defaultCounterStride
    @AppStorage(UserDefaults.Key.counterColor.rawValue) var counterColor: CounterColor = Constants.defaultCounterColor
    @Published var scrollAmount: Double = 0.0
}

//
//  CounterStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import SwiftUI

final class CounterStore: ObservableObject {
    @AppStorage(UserDefaults.Key.counterStride.rawValue) var counterStride: Int = 1
    @Published var scrollAmount: Double = 0.0
}

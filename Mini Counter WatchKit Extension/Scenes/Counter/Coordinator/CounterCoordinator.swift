//
//  CounterCoordinator.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 12.11.2021.
//

import Stinsen
import SwiftUI

final class CounterCoordinator: NavigationCoordinatable {
    // MARK: Stores
    @ObservedObject private var counterStore: CounterStore = CounterStore()
    
    // MARK: Coordinator Properties
    let stack = NavigationStack(initial: \CounterCoordinator.start)
    
    @Root var start = makeStart
    
    // MARK: Init

    init(counterStore: CounterStore) {
        self.counterStore = counterStore
    }

    #if DEBUG
        deinit {
            print("Deinit \(Self.typeName)")
        }
    #endif
}

// MARK: - Factories

private extension CounterCoordinator {
    @ViewBuilder func makeStart() -> some View {
        CounterView(counterStore: counterStore)
    }
}

// MARK: - NameDescribable

extension CounterCoordinator: NameDescribable {}

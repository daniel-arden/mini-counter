//
//  CounterCoordinator.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 12.11.2021.
//

import Stinsen
import SwiftUI

final class CounterCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \CounterCoordinator.start)

    @Root var start = makeStart

    #if DEBUG
        deinit {
            print("Deinit \(Self.typeName)")
        }
    #endif
}

// MARK: - Factories

private extension CounterCoordinator {
    @ViewBuilder func makeStart() -> some View {
        CounterView()
    }
}

// MARK: - NameDescribable

extension CounterCoordinator: NameDescribable {}

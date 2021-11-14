//
//  ListCoordinator.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 12.11.2021.
//

import Stinsen
import SwiftUI

final class ListCoordinator: NavigationCoordinatable {
    // MARK: Coordinator Properties
    let stack = NavigationStack(initial: \ListCoordinator.start)

    @Root var start = makeStart

    // MARK: Init
    #if DEBUG
        deinit {
            print("Deinit \(Self.typeName)")
        }
    #endif
}

// MARK: - Factories

private extension ListCoordinator {
    @ViewBuilder func makeStart() -> some View {
        ListView()
    }
}

// MARK: - NameDescribable

extension ListCoordinator: NameDescribable {}

//
//  SaveDetailCoordinator.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import Stinsen
import SwiftUI

final class SaveDetailCoordinator: NavigationCoordinatable {
    // MARK: Stores

    private let mainStore: MainStore
    private let saveDetailStore: SaveDetailStore

    // MARK: Coordinator Properties

    let stack = NavigationStack(initial: \SaveDetailCoordinator.start)

    @Root var start = makeStart

    // MARK: Init

    init(
        mainStore: MainStore,
        counterCount: Int
    ) {
        self.mainStore = mainStore
        saveDetailStore = SaveDetailStore(
            mainStore: mainStore,
            counterCount: counterCount
        )
    }

    #if DEBUG
        deinit {
            print("Deinit \(Self.typeName)")
        }
    #endif
}

// MARK: - Factories

private extension SaveDetailCoordinator {
    @ViewBuilder func makeStart() -> some View {
        SaveDetailView(
            mainStore: mainStore,
            saveDetailStore: saveDetailStore
        )
    }
}

// MARK: - NameDescribable

extension SaveDetailCoordinator: NameDescribable {}

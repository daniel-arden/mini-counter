//
//  SavedEntryListCoordinator.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 12.11.2021.
//

import Stinsen
import SwiftUI

final class SavedEntryListCoordinator: NavigationCoordinatable {
    // MARK: Stores

    @ObservedObject private var savedEntryStore: SavedEntryStore

    // MARK: Coordinator Properties

    let stack = NavigationStack(initial: \SavedEntryListCoordinator.start)

    @Root var start = makeStart
    @Root(.push) var savedEntryDetail = makeSavedEntryDetail

    // MARK: Init

    init(savedEntryStore: SavedEntryStore) {
        self.savedEntryStore = savedEntryStore
    }

    #if DEBUG
        deinit {
            print("Deinit \(Self.typeName)")
        }
    #endif
}

// MARK: - Factories

private extension SavedEntryListCoordinator {
    @ViewBuilder func makeStart() -> some View {
        SavedEntryListView(savedEntryStore: savedEntryStore)
    }

    func makeSavedEntryDetail(countEntry: CountEntry) -> SavedEntryDetailCoordinator {
        SavedEntryDetailCoordinator(
            countEntryDetailStore: CountEntryDetailStore(countEntry: countEntry)
        )
    }
}

// MARK: - NameDescribable

extension SavedEntryListCoordinator: NameDescribable {}

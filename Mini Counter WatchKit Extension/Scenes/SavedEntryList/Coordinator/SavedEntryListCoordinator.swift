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
    @ObservedObject private var mainStore: MainStore
    
    // MARK: Coordinator Properties
    let stack = NavigationStack(initial: \SavedEntryListCoordinator.start)

    @Root var start = makeStart

    // MARK: Init
    init(mainStore: MainStore) {
        self.mainStore = mainStore
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
        SavedEntryListView(mainStore: mainStore)
    }
}

// MARK: - NameDescribable

extension SavedEntryListCoordinator: NameDescribable {}

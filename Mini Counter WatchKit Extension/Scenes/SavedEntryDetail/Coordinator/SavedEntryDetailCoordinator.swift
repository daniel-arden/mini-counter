//
//  SavedEntryDetailCoordinator.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 24.11.2021.
//

import Stinsen
import SwiftUI

final class SavedEntryDetailCoordinator: NavigationCoordinatable {
    // MARK: Stores
    private let countEntryDetailStore: CountEntryDetailStore

    // MARK: Coordinator Properties
    let stack = NavigationStack(initial: \SavedEntryDetailCoordinator.start)
    
    @Root var start = makeStart
    
    // MARK: Init
    init(countEntryDetailStore: CountEntryDetailStore) {
        self.countEntryDetailStore = countEntryDetailStore
    }
    
#if DEBUG
    deinit {
        print("Deinit \(Self.typeName)")
    }
#endif
}

// MARK: - Factories
private extension SavedEntryDetailCoordinator {
    @ViewBuilder func makeStart() -> some View {
        SavedEntryDetailView(countEntryDetailStore: countEntryDetailStore)
    }
}

// MARK: - NameDescribable
extension SavedEntryDetailCoordinator: NameDescribable {}

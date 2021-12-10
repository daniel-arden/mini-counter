//
//  ActionsCoordinator.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 12.11.2021.
//

import Stinsen
import SwiftUI

final class ActionsCoordinator: NavigationCoordinatable {
    // MARK: Stores

    @ObservedObject private var mainStore: MainStore
    @ObservedObject private var counterStore: CounterStore

    // MARK: Coordinator Properties

    let stack = NavigationStack(initial: \ActionsCoordinator.start)

    @Root var start = makeStart
    @Route(.push) var settings = makeSettings
    @Route(.push) var saveDetail = makeSaveDetail

    // MARK: Init

    init(
        mainStore: MainStore,
        counterStore: CounterStore
    ) {
        self.mainStore = mainStore
        self.counterStore = counterStore
    }

    #if DEBUG
        deinit {
            print("Deinit \(Self.typeName)")
        }
    #endif
}

// MARK: - Factories

private extension ActionsCoordinator {
    @ViewBuilder func makeStart() -> some View {
        ActionsView(
            mainStore: mainStore,
            counterStore: counterStore
        )
    }

    func makeSettings() -> SettingsCoordinator {
        SettingsCoordinator()
    }

    func makeSaveDetail() -> SaveDetailCoordinator {
        SaveDetailCoordinator(
            mainStore: mainStore,
            counterCount: Int(counterStore.counterValue.rounded())
        )
    }
}

// MARK: - NameDescribable

extension ActionsCoordinator: NameDescribable {}

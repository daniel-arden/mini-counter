//
//  MainTabCoordinator.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 12.11.2021.
//

import Stinsen
import SwiftUI

final class MainTabCoordinator: TabCoordinatable {
    // MARK: Stores
    private let counterStore: CounterStore = CounterStore()

    // MARK: Coordinator Properties
    var child = TabChild(
        startingItems: [
            \MainTabCoordinator.actions,
            \MainTabCoordinator.counter,
            \MainTabCoordinator.list,
        ],
        activeTab: 1
    )

    @Route(tabItem: makeActionsTab) var actions = makeActions
    @Route(tabItem: makeCounterTab) var counter = makeCounter
    @Route(tabItem: makeListTab) var list = makeList
    
    // MARK: Init
    #if DEBUG
        deinit {
            print("Deinit \(Self.typeName)")
        }
    #endif
}

// MARK: - Factories

extension MainTabCoordinator {
    // MARK: Actions Tab

    func makeActions() -> ActionsCoordinator {
        ActionsCoordinator()
    }

    @ViewBuilder func makeActionsTab(isActive _: Bool) -> some View {
        ActionsView()
    }

    // MARK: Counter Tab

    func makeCounter() -> CounterCoordinator {
        CounterCoordinator(counterStore: counterStore)
    }

    @ViewBuilder func makeCounterTab(isActive _: Bool) -> some View {
        CounterView(counterStore: counterStore)
    }

    // MARK: List Tab

    func makeList() -> ListCoordinator {
        ListCoordinator()
    }

    @ViewBuilder func makeListTab(isActive _: Bool) -> some View {
        ListView()
    }
}

// MARK: - NameDescribable

extension MainTabCoordinator: NameDescribable {}

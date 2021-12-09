//
//  MainTabCoordinator.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 12.11.2021.
//

import Combine
import Stinsen
import SwiftUI

final class MainTabCoordinator: TabCoordinatable {
    // MARK: Stores
    private let mainStore = MainStore()
    private let counterStore = CounterStore()
    private let savedEntryStore = SavedEntryStore()

    // MARK: Coordinator Properties
    var child = TabChild(
        startingItems: [
            \MainTabCoordinator.actions,
            \MainTabCoordinator.counter,
            \MainTabCoordinator.list,
        ],
        activeTab: Constants.defaultSelectedMainTabIndex
    )

    @Route(tabItem: makeActionsTab) var actions = makeActions
    @Route(tabItem: makeCounterTab) var counter = makeCounter
    @Route(tabItem: makeListTab) var list = makeList
    
    // MARK: Private Properties
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Init
    init() {
        bindToMainStore()
    }

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
        ActionsCoordinator(
            mainStore: mainStore,
            counterStore: counterStore
        )
    }

    @ViewBuilder func makeActionsTab(isActive _: Bool) -> some View {
        ActionsView(
            mainStore: mainStore,
            counterStore: counterStore
        )
    }

    // MARK: Counter Tab

    func makeCounter() -> CounterCoordinator {
        CounterCoordinator(counterStore: counterStore)
    }

    @ViewBuilder func makeCounterTab(isActive _: Bool) -> some View {
        CounterView(counterStore: counterStore)
    }

    // MARK: List Tab

    func makeList() -> SavedEntryListCoordinator {
        SavedEntryListCoordinator(savedEntryStore: savedEntryStore)
    }

    @ViewBuilder func makeListTab(isActive _: Bool) -> some View {
        SavedEntryListView(savedEntryStore: savedEntryStore)
    }
}

// MARK: - Bind To Stores
extension MainTabCoordinator {
    func bindToMainStore() {
        mainStore.resetCounterPublisher
            .sink { [weak self] _ in
                self?.counterStore.resetCounter()
            }
            .store(in: &cancellables)

        mainStore.selectTabIndexPublisher
            .sink { [weak self] newSelectedIndex in
                self?.selectTab(at: newSelectedIndex)
            }
            .store(in: &cancellables)
    }
}

// MARK: - Helpers
private extension MainTabCoordinator {
    func selectTab(at index: Int) {
        child.activeTab = index
    }
}

// MARK: - NameDescribable

extension MainTabCoordinator: NameDescribable {}

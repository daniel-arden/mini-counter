//
//  ActionsCoordinator.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 12.11.2021.
//

import Stinsen
import SwiftUI

final class ActionsCoordinator: NavigationCoordinatable {
    // MARK: Coordinator Properties
    let stack = NavigationStack(initial: \ActionsCoordinator.start)

    @Root var start = makeStart
    @Route(.push) var settings = makeSettings
    @Route(.push) var saveDetail = makeSaveDetail

    // MARK: Init
    #if DEBUG
        deinit {
            print("Deinit \(Self.typeName)")
        }
    #endif
}

// MARK: - Factories

private extension ActionsCoordinator {
    @ViewBuilder func makeStart() -> some View {
        ActionsView()
    }

    func makeSettings() -> SettingsCoordinator {
        SettingsCoordinator()
    }
    
    func makeSaveDetail() -> SaveDetailCoordinator {
        SaveDetailCoordinator()
    }
}

// MARK: - NameDescribable

extension ActionsCoordinator: NameDescribable {}

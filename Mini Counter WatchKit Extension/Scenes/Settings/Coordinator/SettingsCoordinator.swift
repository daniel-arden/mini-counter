//
//  SettingsCoordinator.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 12.11.2021.
//

import Stinsen
import SwiftUI

final class SettingsCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \SettingsCoordinator.start)

    @Root var start = makeStart

    #if DEBUG
        deinit {
            print("Deinit \(Self.typeName)")
        }
    #endif
}

// MARK: - Factories

private extension SettingsCoordinator {
    @ViewBuilder func makeStart() -> some View {
        SettingsView()
    }
}

// MARK: - NameDescribable

extension SettingsCoordinator: NameDescribable {}

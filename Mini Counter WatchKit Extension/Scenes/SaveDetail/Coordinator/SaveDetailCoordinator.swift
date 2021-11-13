//
//  SaveDetailCoordinator.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 13.11.2021.
//

import Stinsen
import SwiftUI

final class SaveDetailCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \SaveDetailCoordinator.start)
    
    @Root var start = makeStart
    
    #if DEBUG
    deinit {
        print("Deinit \(Self.typeName)")
    }
    #endif
}

// MARK: - Factories
private extension SaveDetailCoordinator {
    @ViewBuilder func makeStart() -> some View {
        SaveDetailView()
    }
}

// MARK: - NameDescribable
extension SaveDetailCoordinator: NameDescribable {}

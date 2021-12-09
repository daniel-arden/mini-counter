//
//  CountEntryDetailStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 26.11.2021.
//

import SwiftUI

final class CountEntryDetailStore: ObservableObject {
    let countEntry: CountEntry

    // MARK: Init
    init(countEntry: CountEntry) {
        self.countEntry = countEntry
    }
}

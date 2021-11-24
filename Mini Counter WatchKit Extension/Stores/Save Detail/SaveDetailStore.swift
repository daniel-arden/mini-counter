//
//  SaveDetailStore.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 20.11.2021.
//

import SwiftUI

final class SaveDetailStore: ObservableObject {
    @AppStorage(UserDefaults.Key.counterColor.rawValue) var counterColor: CounterColor = Constants.defaultCounterColor
    @ObservedObject private var mainStore: MainStore
    @State var description: String = ""
    let counterCount: Int
    
    init(
        mainStore: MainStore,
        counterCount: Int
    ) {
        self.mainStore = mainStore
        self.counterCount = counterCount
    }
}

extension SaveDetailStore {
    func saveCount() {
        /*
         TODO: Remove the mainStore from here and save the data persistently instead
         */
        let countEntry: CountEntry = CountEntry(count: counterCount, label: description)
        mainStore.savedEntries.append(countEntry)
    }
}

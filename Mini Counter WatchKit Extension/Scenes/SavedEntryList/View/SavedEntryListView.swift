//
//  SavedEntryListView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct SavedEntryListView: View {
    // MARK: Stores
    @ObservedObject private var mainStore: MainStore
    
    // MARK: Init
    init(mainStore: MainStore) {
        self.mainStore = mainStore
    }

    var body: some View {
        NavigationView {
            Group {
                if mainStore.savedEntries.isEmpty {
                    Text("No saved entries")
                } else {
                    List {
                        Section {
                            ForEach(mainStore.savedEntries) { countEntry in
                                CountEntryView(countEntry: countEntry)
                            }
                        }
                    }
                }
            }
            // FIXME: Double navigation title
            .navigationBarTitleDisplayMode(
                NavigationBarItem.TitleDisplayMode.large
            )
            .navigationTitle("Saved entries")
        }
    }
}

// MARK: - Preview

#if DEBUG
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            SavedEntryListView(mainStore: .init())
        }
    }
#endif

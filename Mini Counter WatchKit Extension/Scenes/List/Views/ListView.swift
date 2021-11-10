//
//  ListView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct ListView: View {
    private let savedEntries: [CountEntry] = CountEntry.mockData

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(savedEntries) { countEntry in
                        CountEntryView(countEntry: countEntry)
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
        ListView()
    }
}
#endif

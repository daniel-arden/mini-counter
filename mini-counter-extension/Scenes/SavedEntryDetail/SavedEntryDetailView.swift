//
//  SavedEntryDetailView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 24.11.2021.
//

import SwiftUI

struct SavedEntryDetailView: View {
    @EnvironmentObject private var savedEntryStore: SavedEntryStore

    let countEntry: CountEntry

    var body: some View {
        NavigationView {
            ScrollView {
                Text("\(countEntry.count)")
                    .font(
                        .system(
                            size: 70,
                            weight: .bold,
                            design: .monospaced
                        )
                    )
                    .foregroundColor(savedEntryStore.counterColor.color)
                    .padding(.vertical)

                Divider()
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(countEntry.label)
    }
}

// MARK: - Preview

#if DEBUG
    struct SavedEntryDetailView_Previews: PreviewProvider {
        static var previews: some View {
            SavedEntryDetailView(countEntry: .mockData[0])
        }
    }
#endif

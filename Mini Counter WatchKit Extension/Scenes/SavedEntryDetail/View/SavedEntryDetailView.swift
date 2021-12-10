//
//  SavedEntryDetailView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 24.11.2021.
//

import SwiftUI

struct SavedEntryDetailView: View {
    @ObservedObject var countEntryDetailStore: CountEntryDetailStore

    var body: some View {
        Text("Saved Entry Detail count: \(countEntryDetailStore.countEntry.count) label: \(countEntryDetailStore.countEntry.label)")
    }
}

// MARK: - Preview

#if DEBUG
    struct SavedEntryDetailView_Previews: PreviewProvider {
        static var previews: some View {
            SavedEntryDetailView(
                countEntryDetailStore: .init(
                    countEntry: .mockData[0]
                )
            )
        }
    }
#endif

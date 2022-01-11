//
//  EditDescriptionView.swift
//  mini-counter WatchKit Extension
//
//  Created by Daniel Arden on 12.12.2021.
//

import SwiftUI

struct EditDescriptionView: View {
    // MARK: Stores

    @EnvironmentObject private var mainStore: MainStore
    @EnvironmentObject private var savedEntryStore: SavedEntryStore

    // MARK: Private Properties

    @Environment(\.dismiss) private var dismiss
    @State private var description: String
    private let countEntry: CountEntry

    // MARK: Init

    init(countEntry: CountEntry) {
        self.countEntry = countEntry
        _description = .init(initialValue: countEntry.label)
    }

    var body: some View {
        VStack {
            TextField(
                LocString.editDescriptionViewCountDescription(),
                text: $description
            )

            Spacer()

            RoundedActionButton(
                LocString.buttonSaveTitle(),
                color: .greenSourCandy
            ) {
                mainStore.updateCountEntryLabel(
                    countEntry,
                    newLabel: description
                )
                savedEntryStore.updateSavedEntryList.toggle()
                dismiss()
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(LocString.editDescriptionViewNavigationTitle())
    }
}

// MARK: - Preview

#if DEBUG
    struct EditDescriptionView_Previews: PreviewProvider {
        static var previews: some View {
            EditDescriptionView(countEntry: .init())
        }
    }
#endif

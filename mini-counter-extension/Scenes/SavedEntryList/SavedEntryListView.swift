//
//  SavedEntryListView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct SavedEntryListView: View {
    // MARK: Stores

    @EnvironmentObject private var mainStore: MainStore
    @EnvironmentObject private var savedEntryStore: SavedEntryStore

    // MARK: Private Properties

    @State private var isEditing = false
    @FetchRequest(sortDescriptors: [SortDescriptor(\.saveDate, order: .reverse)])
    private var savedEntries: FetchedResults<CountEntry>

    var body: some View {
        NavigationView {
            Group {
                if savedEntries.isEmpty {
                    Text(LocString.savedEntryListViewNoSavedEntries())
                } else {
                    List(savedEntries) { countEntry in
                        CountEntryButtonView(
                            isEditing: $isEditing,
                            countEntry: countEntry
                        )
                    }
                    .environmentObject(savedEntryStore)
                    .toolbar {
                        toolbar
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(LocString.savedEntryListViewNavigationTitle())
        }
        .onDisappear {
            isEditing = false
            savedEntryStore.resetSelection()
        }
    }
}

// MARK: - Supplementary Views

private extension SavedEntryListView {
    @ViewBuilder
    private var toolbar: some View {
        if isEditing {
            HStack {
                RoundedActionImageButton("trash.fill", color: .redRage) {
                    withAnimation {
                        mainStore.removeEntries(savedEntryStore.selection)
                    }

                    isEditing.toggle()
                }
                .disabled(savedEntryStore.selection.isEmpty)
                .accessibilityLabel(LocString.savedEntryListViewA11yTrashLabel())

                Spacer()

                RoundedActionButton(
                    LocString.buttonCancelTitle(),
                    color: .grayAsh
                ) {
                    isEditing.toggle()
                    savedEntryStore.resetSelection()
                }
                .accessibilityLabel(LocString.savedEntryListViewA11yCancelLabel())
            }
            .padding(.vertical)
        } else {
            RoundedActionButton(
                LocString.buttonEditTitle(),
                color: .blueAtmosphere
            ) {
                isEditing.toggle()
            }
            .padding(.vertical)
        }
    }
}

// MARK: - Preview

#if DEBUG
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            SavedEntryListView()
        }
    }
#endif

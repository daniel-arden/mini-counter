//
//  SavedEntryListView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct SavedEntryListView: View {
    // MARK: Stores

    @EnvironmentObject private var savedEntryStore: SavedEntryStore

    // MARK: Private Properties

    @State private var isEditing = false

    var body: some View {
        NavigationView {
            Group {
                if savedEntryStore.savedEntries.isEmpty {
                    Text(LocString.savedEntryListViewNoSavedEntries())
                } else {
                    List(savedEntryStore.savedEntries) { countEntry in
                        if isEditing {
                            Button {
                                savedEntryStore.toggleSelectionOnID(countEntry.id)
                            } label: {
                                countEntryLabel(countEntry)
                            }
                            .buttonStyle(.plain)
                            .foregroundColor(
                                savedEntryStore.selection.contains(countEntry.id) ?
                                    .redRage :
                                    .white
                            )
                            .animation(.easeInOut, value: isEditing)

                        } else {
                            NavigationLink {
                                SavedEntryDetailView(countEntry: countEntry)
                                    .environmentObject(savedEntryStore)
                            } label: {
                                countEntryLabel(countEntry)
                            }
                        }
                    }
                    .animation(.default, value: savedEntryStore.savedEntries)
                    .toolbar {
                        // TODO: Add animation for when toolbar buttons change
                        if isEditing {
                            HStack {
                                RoundedActionImageButton("trash.fill", color: .redRage) {
                                    withAnimation {
                                        savedEntryStore.removeSelectedEntries()
                                    }

                                    isEditing.toggle()
                                }
                                .disabled(savedEntryStore.selection.isEmpty)

                                Spacer()

                                RoundedActionButton(
                                    LocString.buttonCancelTitle(),
                                    color: .grayAsh
                                ) {
                                    isEditing.toggle()
                                    savedEntryStore.resetSelection()
                                }
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
    private func countEntryLabel(_ countEntry: CountEntry) -> some View {
        Group {
            if !countEntry.label.isEmpty {
                HStack {
                    Text(countEntry.label)

                    Spacer(minLength: 8)

                    Text("\(countEntry.count)")
                        .fontWeight(.bold)
                }
            } else {
                Text("\(countEntry.count)")
                    .fontWeight(.bold)
            }
        }
        .maxWidth()
        // Setting the contentShape to Rectangle makes the full width tappable
        // Taken from this SO answer: https://stackoverflow.com/a/65101136/10876104
        .contentShape(Rectangle())
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

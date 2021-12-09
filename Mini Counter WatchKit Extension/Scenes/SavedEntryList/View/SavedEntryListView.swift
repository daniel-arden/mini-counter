//
//  SavedEntryListView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct SavedEntryListView: View {
    // MARK: Stores
    @ObservedObject private var savedEntryStore: SavedEntryStore
    
    // MARK: Private Properties
    @EnvironmentObject private var savedEntryListRouter: SavedEntryListCoordinator.Router
    @State private var isEditing = false
    
    // MARK: Init
    init(savedEntryStore: SavedEntryStore) {
        self.savedEntryStore = savedEntryStore
    }

    var body: some View {
        NavigationView {
            Group {
                if savedEntryStore.savedEntries.isEmpty {
                    Text("No saved entries")
                } else {
                    List(savedEntryStore.savedEntries) { countEntry in
                        CountEntryView(
                            countEntry: countEntry,
                            isEditing: $isEditing,
                            isSelected: savedEntryStore.selection.contains(countEntry.id)
                        ) {
                            if isEditing {
                                withAnimation {
                                    savedEntryStore.toggleSelectionOnID(countEntry.id)
                                }
                            } else {
                                savedEntryListRouter.route(to: \.savedEntryDetail, countEntry)
                            }
                        }
                        .animation(.default, value: savedEntryStore.savedEntries)
                    }
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

                                RoundedActionButton("Cancel", color: .grayAsh) {
                                    isEditing.toggle()
                                    savedEntryStore.resetSelection()
                                }
                            }
                            .padding(.vertical)
                        } else {
                            RoundedActionButton("Edit", color: .blueAtmosphere) {
                                isEditing.toggle()
                            }
                            .padding(.vertical)
                        }
                    }
                }
            }
            // FIXME: Double navigation title
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Saved entries")
        }
        .onDisappear {
            isEditing = false
            savedEntryStore.resetSelection()
        }
    }
}

// MARK: - Preview

#if DEBUG
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            SavedEntryListView(savedEntryStore: .init())
        }
    }
#endif

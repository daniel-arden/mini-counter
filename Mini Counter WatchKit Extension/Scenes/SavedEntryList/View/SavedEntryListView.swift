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
    @State private var isEditing: Bool = false
    
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
                                savedEntryStore.toggleSelectionOnID(countEntry.id)
                            } else {
                                savedEntryListRouter.route(to: \.savedEntryDetail, countEntry)
                            }
                        }
                        .animation(Animation.default, value: savedEntryStore.savedEntries)
                    }
                    .toolbar {
                        if isEditing {
                            HStack {
                                OvalActionButton(
                                    title: "Remove Selected",
                                    buttonColor: .redRage,
                                    style: OvalButtonStyle.Style.scrollingView
                                ) {
                                    withAnimation {
                                        savedEntryStore.removeSelectedEntries()
                                    }
                                    isEditing.toggle()
                                }

                                Spacer()

                                OvalActionButton(
                                    title: "Cancel",
                                    buttonColor: Color.grayAsh,
                                    style: OvalButtonStyle.Style.scrollingView
                                ) {
                                    isEditing.toggle()
                                    savedEntryStore.resetSelection()
                                }
                            }
                            .padding(Edge.Set.vertical)
                        } else {
                            OvalActionButton(
                                title: "Edit",
                                buttonColor: Color.blueAtmosphere,
                                style: OvalButtonStyle.Style.scrollingView
                            ) {
                                isEditing.toggle()
                            }
                            .padding(Edge.Set.vertical)
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

//
//  SavedEntryDetailView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 24.11.2021.
//

import SwiftUI

struct SavedEntryDetailView: View {
    // MARK: Stores

    @EnvironmentObject private var counterStore: CounterStore
    @EnvironmentObject private var mainStore: MainStore
    @EnvironmentObject private var savedEntryStore: SavedEntryStore

    // MARK: Private Properties

    @Environment(\.presentationMode) private var presentationMode
    @State private var showDeleteEntryAlert = false
    @State private var showRevertCountAlert = false

    // MARK: Public Properties

    let countEntry: CountEntry

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
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
                    .maxWidth()

                Divider()

                VStack(alignment: .leading, spacing: 8) {
                    Text(LocString.savedEntryDetailViewSaveDate())
                        .font(.headline)
                        .foregroundColor(.accentColor)

                    Text(countEntry.formattedDate)
                }
                .padding(.vertical)

                VStack(alignment: .leading, spacing: 8) {
                    Text(LocString.saveDetailViewCountDescription())
                        .font(.headline)
                        .foregroundColor(.accentColor)

                    Text(countEntry.description.isEmpty ? "-" : countEntry.description)
                }
                .padding(.vertical)

                VStack(spacing: 4) {
                    NavigationLink(LocString.buttonEditDescriptionTitle()) {
                        EditDescriptionView(countEntry: countEntry)
                            .environmentObject(savedEntryStore)
                    }
                    .buttonStyle(.bordered)
                    .tint(.greenSourCandy.opacity(10))
                    .foregroundColor(.white)
                    .frame(maxHeight: 44)
                    // NavigationLink has implicitly smaller padding than Button, workaround
                    .padding(.vertical, 2)

                    RoundedActionButton(
                        LocString.buttonRevertCountTitle(),
                        color: .orangeFire
                    ) {
                        showRevertCountAlert.toggle()
                    }
                    .alert(isPresented: $showRevertCountAlert) {
                        Alert(
                            title: Text(LocString.alertRevertCountTitle()),
                            message: Text(LocString.alertRevertCountCaption()),
                            primaryButton: .destructive(
                                Text(LocString.buttonRevertTitle())
                            ) {
                                presentationMode.wrappedValue.dismiss()
                                counterStore.counterValue = Double(countEntry.count)
                                counterStore.countDescription = countEntry.description
                                mainStore.selectTabIndexPublisher.send(1)
                                savedEntryStore.removeEntry(id: countEntry.id)
                            },
                            secondaryButton: .cancel(
                                Text(LocString.buttonCancelTitle())
                            ) {
                                showRevertCountAlert.toggle()
                            }
                        )
                    }

                    RoundedActionButton(
                        LocString.buttonDeleteEntryTitle(),
                        color: .redRage
                    ) {
                        showDeleteEntryAlert.toggle()
                    }
                    .alert(isPresented: $showDeleteEntryAlert) {
                        Alert(
                            title: Text(LocString.alertDeleteEntryTitle()),
                            message: Text(LocString.alertDeleteEntryCaption()),
                            primaryButton: .destructive(
                                Text(LocString.buttonRemoveTitle())
                            ) {
                                showDeleteEntryAlert.toggle()
                                presentationMode.wrappedValue.dismiss()
                                withAnimation {
                                    savedEntryStore.removeEntry(id: countEntry.id)
                                }
                            },
                            secondaryButton: .cancel(
                                Text(LocString.buttonCancelTitle())
                            ) {
                                showDeleteEntryAlert.toggle()
                            }
                        )
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(countEntry.description)
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

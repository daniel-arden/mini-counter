//
//  CountEntryButtonView.swift
//  mini-counter WatchKit Extension
//
//  Created by Daniel Arden on 22.12.2021.
//

import SwiftUI

struct CountEntryButtonView: View {
    // MARK: Stores

    @EnvironmentObject private var savedEntryStore: SavedEntryStore

    // MARK: Private Properties

    private var a11yLabelSuffix: String {
        savedEntryStore.selection.contains(countEntry.id) ?
            LocString.countEntryButtonViewA11ySelectedSuffix() :
            LocString.countEntryButtonViewA11yNotSelectedSuffix()
    }

    // MARK: Public Properties

    @Binding var isEditing: Bool
    let countEntry: CountEntry

    var body: some View {
        if isEditing {
            Button {
                savedEntryStore.toggleSelectionOnID(countEntry.id)
            } label: {
                countEntryLabel(countEntry)
                    .center(.vertical)
            }
            .buttonStyle(.plain)
            .foregroundColor(
                savedEntryStore.selection.contains(countEntry.id) ?
                    .redRage :
                    .white
            )
            .animation(.easeInOut, value: isEditing)
            .accessibilityLabel(
                "\(countEntry.description) \(countEntry.count) \(a11yLabelSuffix)"
            )
            .accessibilityHint(
                LocString.countEntryButtonViewA11ySelectionToggleHint()
            )
        } else {
            NavigationLink {
                SavedEntryDetailView(countEntry: countEntry)
                    .environmentObject(savedEntryStore)
            } label: {
                countEntryLabel(countEntry)
                    .center(.vertical)
            }
            .accessibilityHint(
                LocString.countEntryButtonViewA11yEntryDetailHint()
            )
        }
    }
}

// MARK: - Supplementary Views

private extension CountEntryButtonView {
    @ViewBuilder
    private func countEntryLabel(_ countEntry: CountEntry) -> some View {
        Group {
            if !countEntry.description.isEmpty {
                HStack {
                    Text(countEntry.description)

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
    struct CountEntryButtonView_Previews: PreviewProvider {
        static var previews: some View {
            CountEntryButtonView(
                isEditing: .constant(true),
                countEntry: .mockData[0]
            )
        }
    }
#endif

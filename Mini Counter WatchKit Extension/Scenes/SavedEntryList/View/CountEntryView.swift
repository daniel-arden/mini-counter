//
//  CountEntryView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 04.11.2021.
//

import SwiftUI

struct CountEntryView: View {
    let countEntry: CountEntry
    @Binding var isEditing: Bool
    var isSelected: Bool
    let onTapAction: () -> Void

    var body: some View {
        Button(action: onTapAction) {
            if !countEntry.label.isEmpty {
                Text(countEntry.label)

                Spacer(minLength: 8)

                Text("\(countEntry.count)")
                    .fontWeight(.bold)
            } else {
                Text("\(countEntry.count)")
                    .fontWeight(.bold)
            }
        }
        .maxWidth()
        .buttonStyle(.plain)
        .foregroundColor(isSelected ? .redRage : .white)
        .animation(.easeInOut, value: isEditing)
    }
}

// MARK: - Preview

#if DEBUG
    struct CountEntryView_Previews: PreviewProvider {
        static var previews: some View {
            List(CountEntry.mockData) { countEntry in
                CountEntryView(
                    countEntry: countEntry,
                    isEditing: .constant(false),
                    isSelected: false,
                    onTapAction: {}
                )
            }
        }
    }
#endif

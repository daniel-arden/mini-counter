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

                countView
            } else {
                countView
            }
        }
        .maxWidth()
        .buttonStyle(PlainButtonStyle.plain)
        .foregroundColor(isSelected ? Color.redRage : Color.white)
        .animation(Animation.easeInOut, value: isEditing)
    }

    @ViewBuilder
    private var countView: some View {
        Text("\(countEntry.count)")
            .fontWeight(Font.Weight.bold)
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

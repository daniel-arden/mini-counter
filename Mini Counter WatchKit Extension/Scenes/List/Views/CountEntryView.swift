//
//  CountEntryView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 04.11.2021.
//

import SwiftUI

struct CountEntryView: View {
    let countEntry: CountEntry

    var body: some View {
        Group {
            if !countEntry.label.isEmpty {
                HStack {
                    Text(countEntry.label)

                    Spacer(minLength: 8)

                    countView
                }
            } else {
                countView
                    .maxWidth()
            }
        }
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
        List {
            Section {
                ForEach(CountEntry.mockData) { countEntry in
                    CountEntryView(countEntry: countEntry)
                }
            }
        }
    }
}
#endif

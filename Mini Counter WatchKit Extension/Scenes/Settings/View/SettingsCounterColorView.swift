//
//  SettingsCounterColorView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 14.11.2021.
//

import SwiftUI

struct SettingsCounterColorView: View {
    // MARK: Stores
    @ObservedObject private var settingsStore: SettingsStore
    
    // MARK: Private Properties
    private static let colorDotDimension: CGFloat = 24
    private static let colorDotPadding: CGFloat = 2
    private static let gridItemDimension: CGFloat = Self.colorDotDimension + Self.colorDotPadding
    
    private let gridItems: [GridItem] = Array(
        repeating: GridItem(
            GridItem.Size.fixed(Self.gridItemDimension)
        ),
        count: 4
    )

    // MARK: Init
    init(settingsStore: SettingsStore) {
        self.settingsStore = settingsStore
    }

    var body: some View {
        LazyVGrid(columns: gridItems) {
            ForEach(CounterColor.allCases) { counterColor in
                ColorDotView(
                    counterColor: counterColor,
                    selectedColor: $settingsStore.counterColor
                )
                .squareFrame(Self.colorDotDimension)
            }
            .padding(Self.colorDotPadding)
        }
    }
}

// MARK: - Preview
#if DEBUG
struct SettingsCounterColorView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCounterColorView(settingsStore: .init())
    }
}
#endif

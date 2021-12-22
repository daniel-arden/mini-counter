//
//  CounterView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct CounterView: View {
    // MARK: Stores

    @EnvironmentObject private var counterStore: CounterStore

    // MARK: Init

    var body: some View {
        Text("\(counterStore.counterValue.roundedInt)")
            .font(
                .system(
                    size: 100,
                    weight: .bold,
                    design: .monospaced
                )
            )
            .foregroundColor(counterStore.counterColor.color)
            .minimumScaleFactor(0.2)
            .lineLimit(1)
            .maxWidth()
            .focusable()
            .digitalCrownRotation(
                $counterStore.counterValue,
                from: Double(Constants.counterValueRange.lowerBound),
                through: Double(Constants.counterValueRange.upperBound),
                by: Double(counterStore.counterStride),
                sensitivity: .medium
            )
            .maxFrame()
            .id(counterStore.counterStride)
            .accessibilityLabel(
                LocString.counterViewA11yCountLabel(
                    counterStore.counterValue.roundedInt
                )
            )
            .accessibilityHint(LocString.counterViewA11yCountHint())
    }
}

// MARK: - Preview

#if DEBUG
    struct CounterView_Previews: PreviewProvider {
        static var previews: some View {
            CounterView()
        }
    }
#endif

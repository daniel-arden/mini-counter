//
//  CounterView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject private var counterStore: CounterStore
    
    init(counterStore: CounterStore) {
        self.counterStore = counterStore
    }

    var body: some View {
        Text("\(Int(counterStore.scrollAmount.rounded()))")
            .font(
                Font.system(
                    size: 100,
                    weight: .bold,
                    design: .monospaced
                )
            )
            .minimumScaleFactor(0.2)
            .lineLimit(1)
            .maxWidth()
            .focusable()
            .digitalCrownRotation(
                $counterStore.scrollAmount,
                from: 0,
                through: 999,
                by: Double(counterStore.counterStride),
                sensitivity: DigitalCrownRotationalSensitivity.medium
            )
            .maxFrame()
            .id(counterStore.counterStride)
    }
}

// MARK: - Preview

#if DEBUG
    struct CounterView_Previews: PreviewProvider {
        static var previews: some View {
            CounterView(counterStore: .init())
        }
    }
#endif
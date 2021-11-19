//
//  CounterView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct CounterView: View {
    // MARK: Stores
    @ObservedObject private var counterStore: CounterStore
    
    // MARK: Init
    init(counterStore: CounterStore) {
        self.counterStore = counterStore
    }

    var body: some View {
        Text("\(Int(counterStore.counterValue.rounded()))")
            .font(
                Font.system(
                    size: 100,
                    weight: Font.Weight.bold,
                    design: Font.Design.monospaced
                )
            )
            .foregroundColor(counterStore.counterColor.color)
            .minimumScaleFactor(0.2)
            .lineLimit(1)
            .maxWidth()
            .focusable()
            .digitalCrownRotation(
                $counterStore.counterValue,
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

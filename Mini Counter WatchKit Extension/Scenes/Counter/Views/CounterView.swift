//
//  CounterView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import SwiftUI

struct CounterView: View {
    @State private var count: Int = 0
    @State private var scrollAmount: Double = 0.0

    var body: some View {
        Text("\(Int(scrollAmount))")
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
                $scrollAmount,
                from: 0,
                through: 999,
                by: 1,
                sensitivity: DigitalCrownRotationalSensitivity.low
            )
            .maxFrame()
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

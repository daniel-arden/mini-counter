//
//  ColorDotView.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 14.11.2021.
//

import SwiftUI

struct ColorDotView: View {
    // MARK: Private Properties

    /// Equals to true if `counterColor` is the same as `selectedColor`
    private var counterColorSelected: Bool {
        $selectedColor.wrappedValue == counterColor
    }

    private var a11yLabel: String {
        if counterColorSelected {
            return LocString.colorDotViewA11yCurrentlySelectedLabel(
                counterColor.name
            )
        } else {
            return counterColor.name
        }
    }

    private var a11yHint: String {
        guard !counterColorSelected else {
            return ""
        }

        return LocString.colorDotViewA11yActionHint(counterColor.name)
    }

    // MARK: Public Properties

    let counterColor: CounterColor
    @Binding var selectedColor: CounterColor

    var body: some View {
        GeometryReader { geometry in
            Button {
                guard !counterColorSelected else {
                    return
                }

                withAnimation(.easeInOut) {
                    selectedColor = counterColor
                }
            } label: {
                ZStack {
                    if counterColorSelected {
                        Circle()
                            .stroke(lineWidth: geometry.size.height / 12.0)
                            .foregroundColor(counterColor.color)
                    }

                    Circle()
                        .fill(counterColor.color)
                        .padding(geometry.size.height / 10.0)
                }
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 1)
        .accessibilityLabel(a11yLabel)
        .accessibilityHint(a11yHint)
    }
}

// MARK: - Preview

#if DEBUG
    struct ColorDotView_Previews: PreviewProvider {
        static var previews: some View {
            ColorDotView(counterColor: .redRage, selectedColor: .constant(.purpleMedium))
                .squareFrame(48)
                .previewLayout(.sizeThatFits)

            ColorDotView(counterColor: .yellowDanger, selectedColor: .constant(.yellowDanger))
                .squareFrame(48)
                .previewLayout(.sizeThatFits)
        }
    }
#endif
